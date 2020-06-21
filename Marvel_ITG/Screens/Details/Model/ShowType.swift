//
//  Comic.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/19/20.
//

import Foundation

struct ShowType: Codable {
    let id: Int
    let thumbnail: Image
    let title: String
}

extension ShowType {
    
    enum CodingKeys: String , CodingKey {
        case id
        case thumbnail
        case title
    }
    
}
