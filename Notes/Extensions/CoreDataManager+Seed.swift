//
//  CoreDataManager+Seed.swift
//  Notes
//
//  Created by Oluwatobi Omotayo on 06/12/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import CoreData

extension CoreDataManager {
    
    // MARK: - Public API
    
    func seed(_ completion: (() -> Void)? = nil) {
        guard !UserDefaults.didSeedPersistentStore else { return }
        
        let operation = SeedOperation(with: mainManagedObjectContext) { (success) in
            completion?()
            
            UserDefaults.setDidSeedPersistentStore(success)
        }
        
        operationQueue.addOperation(operation)
    }
    
}
