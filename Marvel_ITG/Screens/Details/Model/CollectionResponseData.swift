//
//  CollectionResponseData.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/20/20.
//

import Foundation

struct CollectionResponseData: Codable {
    let data: CollectionData
    
}

extension CollectionResponseData {
    
    enum CodingKeys: String , CodingKey {
        case data
    }
}
