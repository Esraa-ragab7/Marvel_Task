//
//  CharacterData.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/20/20.
//

import Foundation

struct CharacterData: Codable {
    let offset: Int
    let limit: Int?
    let total: Int?
    let count: Int?
    let characters: [Character]?
    
}

extension CharacterData {
    
    enum CodingKeys: String , CodingKey {
        case offset
        case limit
        case total
        case count
        case characters = "results"
    }
}
