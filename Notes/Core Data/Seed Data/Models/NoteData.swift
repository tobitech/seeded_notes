//
//  NoteData.swift
//  Notes
//
//  Created by Oluwatobi Omotayo on 06/12/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import Foundation

struct NoteData: Codable {
    
    let title: String
    let contents: String
    
    let createdAt: Date
    let updatedAt: Date
    
    let tags: [String]
    let category: String
    
}
