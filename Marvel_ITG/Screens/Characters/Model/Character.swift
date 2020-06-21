//
//  Character.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/19/20.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String?
    let description: String?
    let thumbnail: Image?
    let comics: Comics?
    
}

extension Character {
    
    enum CodingKeys: String , CodingKey {
        case id
        case name
        case description
        case thumbnail
        case comics
    }
}
