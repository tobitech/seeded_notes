//
//  SeedOperation.swift
//  Notes
//
//  Created by Oluwatobi Omotayo on 06/12/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import Foundation
import CoreData

class SeedOperation: Operation {
    
    enum SeedError: Error {
        case seedDataNotFound
    }
    
    typealias SeedOperationCompletion = ((Bool) -> Void)
    
    // MARK: - Properties
    
    private let privateManagedObjectContext: NSManagedObjectContext
    
    private var data: Data?
    
    var isFetching: Bool = false
    
    // MARK: -
    
    private let completion: SeedOperationCompletion?
    
    init(with managedObjectContext: NSManagedObjectContext, completion: SeedOperationCompletion? = nil) {
        privateManagedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        
        privateManagedObjectContext.parent = managedObjectContext
        
        self.completion = completion
        
        super.init()
    }
    
    override func main() {
        
        do {
            try fetchData()
            
            while isFetching { }
            
            if let data = data {
                // Seed With Data
                try seed(with: data)
                
                completion?(true)
            } else {
                completion?(false)
            }
        } catch {
            print("Unable to Save Managed Object Context After Seeding Persistent Store \(error)")
            
            completion?(false)
        }
    }
    
    // MARK: - Helper Methods
    
    private func fetchData() throws {
        isFetching = true
        // Load Seed Data From Bundle
        guard let url = URL(string: "https://cocoacasts.s3.amazonaws.com/resources/seeding-a-core-data-persistent-store/seed.json") else {
            throw SeedError.seedDataNotFound
        }
        
        // Fetch the Data
        URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
            // Update the Data
            self?.data = data
            
            self?.isFetching = false
        }.resume()
        
    }
    
    private func seed(with data: Data) throws {
        // Initialize JSON Decoder
        let decoder = JSONDecoder()
        
        // Configure JSON Decoder
        decoder.dateDecodingStrategy = .secondsSince1970
        
        // Initialize seed data
        let seed = try decoder.decode(Seed.self, from: data)
        
        var tagsBuffer: [Tag] = []
        var categoriesBuffer: [Category] = []
        
        for data in seed.tags {
            let tag = Tag(context: privateManagedObjectContext)
            
            tag.name = data.name
            
            tagsBuffer.append(tag)
        }
        
        for data in seed.categories {
            let category = Category(context: privateManagedObjectContext)
            
            category.name = data.name
            category.colorAsHex = data.colorAsHex
            
            categoriesBuffer.append(category)
        }
        
        for data in seed.notes {
            let note = Note(context: privateManagedObjectContext)
            
            note.title = data.title
            note.contents = data.contents
            note.createdAt = data.createdAt
            note.updatedAt = data.updatedAt
            
            note.category = categoriesBuffer.first {
                return $0.name == data.category
            }
            
            let tagsAsSet = Set(data.tags)
            
            for tag in tagsBuffer {
                guard let name = tag.name else {
                    continue
                }
                
                if tagsAsSet.contains(name) {
                    note.addToTags(tag)
                }
            }
            
            // Save Changes
            try privateManagedObjectContext.save()
            
        }
        
    }
    
}
