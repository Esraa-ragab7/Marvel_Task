//
//  CharacterResponse.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/20/20.
//

import Foundation

struct CharacterResponse: Codable {
    let code: Int
    let status: String?
    let data: CharacterData?
    
}

extension CharacterResponse {
    
    enum CodingKeys: String , CodingKey {
        case code
        case status
        case data
    }
}
