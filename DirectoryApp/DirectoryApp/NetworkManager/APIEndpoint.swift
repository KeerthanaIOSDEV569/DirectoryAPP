//
//  APIEndpoint.swift
//  DirectoryApp
//
//  Created by Siddu Lakshmi Keerthana on 24/10/22.
//

import Foundation

enum APIEndpoint {
    
    case people
    case rooms
    
    enum Method: String {
        case GET
        case POST
        case PUT
        case DELETE
    }
    
    /// Define all your endpoints here
}

extension APIEndpoint {

    /// The path for every endpoint
    var path: String {
        switch self {
        case .people:
            return "people"
        case .rooms:
            return "rooms"
        }
    }
    
    /// The method for the endpoint
    var method: APIEndpoint.Method {
        switch self {
        case .people:
            return .GET
        case .rooms:
            return .GET
        default:
            return .GET
        }
    }
    
    /// The URL parameters for the endpoint (in case it has any)
    var parameters: [URLQueryItem]? {
        switch self {
        case .people:
            return nil
        case .rooms:
            return nil
        default:
            return nil
        }
    }
}
