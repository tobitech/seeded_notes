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
        
        let seed = Seed()
        
        var tagsBuffer: [Tag] = []
        var categoriesBuffer: [Category] = []
        
        for name in seed.tags {
            let tag = Tag(context: privateManagedObjectContext)
            
            tag.name = name
            
            tagsBuffer.append(tag)
        }
        
        for data in seed.categories {
            let category = Category(context: privateManagedObjectContext)
            
            category.name = data.name
            category.colorAsHex = data.colorAsHex
            
            categoriesBuffer.append(category)
        }
        
        for (index, data) in seed.notes.enumerated() {
            let note = Note(context: privateManagedObjectContext)
            
            note.title = data.title
            note.contents = seed.contents[index]
            note.createdAt = Date(timeIntervalSince1970: data.createdAt)
            note.updatedAt = Date(timeIntervalSince1970: data.updatedAt)
            
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
