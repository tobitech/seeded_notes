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
    
    private let privateManagedObjectContext: NSManagedObjectContext
    
    private let completion: SeedOperationCompletion?
    
    init(with managedObjectContext: NSManagedObjectContext, completion: SeedOperationCompletion? = nil) {
        privateManagedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        
        privateManagedObjectContext.parent = managedObjectContext
        
        self.completion = completion
        
        super.init()
    }
    
    override func main() {
        
        do {
            // Seed With Data
            try seed()
            
            completion?(true)
        } catch {
            print("Unable to Save Managed Object Context After Seeding Persistent Store \(error)")
            
            completion?(false)
        }
    }
    
    private func seed() throws {
        guard let url = Bundle.main.url(forResource: "seed", withExtension: "json") else {
            throw SeedError.seedDataNotFound
        }
        
        let data = try Data(contentsOf: url)
        
        let decoder = JSONDecoder()
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
