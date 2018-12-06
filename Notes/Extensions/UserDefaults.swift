//
//  UserDefaults.swift
//  Notes
//
//  Created by Oluwatobi Omotayo on 06/12/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    private enum Keys {
        
        static let DidSeedPersistentStore = "didSeedPersistentStore"
        
    }
    
    class func setDidSeedPersistentStore(_ didSeedPersistentStore: Bool) {
        UserDefaults.standard.set(didSeedPersistentStore, forKey: Keys.DidSeedPersistentStore)
    }
    
    class var didSeedPersistentStore: Bool {
        return UserDefaults.standard.bool(forKey: Keys.DidSeedPersistentStore)
    }
    
}
