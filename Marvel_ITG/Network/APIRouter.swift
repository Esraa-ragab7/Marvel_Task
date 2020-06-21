//
//  APIRouter.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/19/20.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    case getCharchters(text: String, offset: Int, limit: Int)
    case getCollections(offset: Int, limit: Int, url: String)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .getCharchters, .getCollections:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .getCharchters:
            return "/characters?"
        case .getCollections( _, _, let url):
            return "\(url)?"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .getCharchters, .getCollections:
            return nil
        }
    }
    
    // MARK: - Headers
    private var queries: [String:String] {
        switch self {
        case .getCharchters(let text, let offset, let limit):
            if text != "" {
                return ["nameStartsWith": text, "offset": "\(offset)", "limit": "\(limit)"]
            }
            return ["offset": "\(offset)", "limit": "\(limit)"]
        case .getCollections(let offset, let limit, _):
            return ["offset": "\(offset)", "limit": "\(limit)"]
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        var url = Constants.ProductionServer.baseURL
        if path.contains("http") {
            url = ""
        }
        let components = URLComponents(string: "\(url)\(path)\(queries.queryString ?? "")\(Constants.ProductionServer.getCredentials())")!
        
        var urlRequest = URLRequest(url: components.url!)
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}

struct Queries {
    let key: String
    let value: String
}
