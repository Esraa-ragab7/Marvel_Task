//
//  CollectionData.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/20/20.
//

import Foundation

struct CollectionData: Codable {
    let results: [ShowType]
    
}

extension CollectionData {
    
    enum CodingKeys: String , CodingKey {
        case results
    }
}
