//
//  APIClient.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/19/20.
//

import Alamofire

class APIClient {
    
    static func getCharchters(offset: Int, limit: Int, completion:@escaping  (Result<CharacterResponse,Error>)->Void) {
        AF.request(APIRouter.getCharchters(offset: offset, limit: limit)).responseDecodable { (response: DataResponse<CharacterResponse>) in
            completion(response.result)
        }
    }
    
    static func getCollections(limit: Int, url: String, completion:@escaping  (Result<CollectionResponseData,Error>)->Void) {
        AF.request(APIRouter.getCollections(offset: 0, limit: limit, url: url)).responseDecodable { (response: DataResponse<CollectionResponseData>) in
            completion(response.result)
        }
    }
    
}
