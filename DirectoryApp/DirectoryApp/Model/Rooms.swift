//
//  Rooms.swift
//  DirectoryApp
//
//  Created by Siddu Lakshmi Keerthana on 23/10/22.
//

import Foundation

class Rooms: Codable {
    ///Properties
    var createdAt: String!
    var isOccupied: Bool!
    let maxOccupancy: Int!
    var id: String!
    
    /// decoding
    required init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        createdAt = try container.decode(String.self, forKey: .createdAt)
        isOccupied = try container.decode(Bool.self, forKey: .isOccupied)
        maxOccupancy = try container.decode(Int.self, forKey: .maxOccupancy)
        id = try container.decode(String.self, forKey: .id)

    }


}
 
