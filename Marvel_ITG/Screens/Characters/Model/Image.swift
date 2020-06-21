//
//  Image.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/19/20.
//

import Foundation

struct Image: Codable {
    
    let imageUrl: URL?
    let path: String
    let imageExtension: String
        
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        path = try container.decode(String.self, forKey: .path)
        imageExtension = try container.decode(String.self, forKey: .imageExtension)
        imageUrl = URL(string: "\(path).\(imageExtension)") ?? nil
    }
    
    init(imageUrl: URL) {
        self.imageUrl = imageUrl
        path = ""
        imageExtension = ""
    }
}

extension Image {
    
    enum CodingKeys: String, CodingKey {
        case path
        case imageExtension = "extension"
    }
    
}
