//
//  Environment.swift
//  DirectoryApp
//
//  Created by Siddu Lakshmi Keerthana on 24/10/22.
//

import Foundation

/// Define all your ApiManager's utilities here
struct Environment {
    
    /// API Base URL
    static let apiBaseURL = "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/"
}

class APIResponse<T : Decodable>: Decodable {
    
    let data: T?
    
    enum CodingKeys: String, CodingKey {
        case  data
    }
    
    required init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        data = try container.decode(T.self, forKey: .data)
    }

}

