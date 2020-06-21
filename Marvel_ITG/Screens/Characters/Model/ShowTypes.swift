//
//  Comics.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/20/20.
//

import Foundation

struct ShowTypes: Codable {
    let available: Int
    let collectionURI: String
}

extension ShowTypes {
    
    enum CodingKeys: String , CodingKey {
        case available
        case collectionURI
    }
    
}
