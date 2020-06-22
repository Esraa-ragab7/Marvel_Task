//
//  Constants.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/19/20.
//

import Foundation
import CryptoSwift
import Keys

struct Constants {
    struct ProductionServer {
        static let baseURL = "https://gateway.marvel.com/v1/public"
        
        static func getCredentials() -> String{
            let keys = Marvel_ITGKeys()
            let ts = Date().timeIntervalSince1970.description
            let hash = "\(ts)\(keys.privateKey)\(keys.publicKey)".md5()
            let authParams = ["ts": ts, "apikey": keys.publicKey, "hash": hash]
            return authParams.queryString!
        }
    }
    
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
