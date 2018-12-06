//
//  Seed.swift
//  Notes
//
//  Created by Oluwatobi Omotayo on 06/12/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import Foundation

struct Seed: Codable {
    
    // MARK: - Seed Data
    let tags: [TagData]
    let categories: [CategoryData]
    let notes: [NoteData]
    
}
