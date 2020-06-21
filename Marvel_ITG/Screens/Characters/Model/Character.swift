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
    let resourceURI: String
    let comics: ShowTypes
    let series: ShowTypes
    let stories: ShowTypes
    let events: ShowTypes
    
}

extension Character {
    
    enum CodingKeys: String , CodingKey {
        case id
        case name
        case description
        case thumbnail
        case resourceURI
        case comics
        case series
        case stories
        case events
    }
}
