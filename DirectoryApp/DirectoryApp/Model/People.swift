//
//  People.swift
//  DirectoryApp
//
//  Created by Siddu Lakshmi Keerthana on 23/10/22.
//

import Foundation

class People: Codable {
    ///Properties
    var createdAt: String!
    var firstName: String!
    let avatar: String!
    var lastName: String!
    let email: String!
    let jobtitle: String!
    let favouriteColor: String!
    let id: String!
    
    ///Decoding
    required init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        createdAt = try container.decode(String.self, forKey: .createdAt)
        firstName = try container.decode(String.self, forKey: .firstName)
        avatar = try container.decode(String.self, forKey: .avatar)
        lastName = try container.decode(String.self, forKey: .lastName)
        email = try container.decode(String.self, forKey: .email)
        jobtitle = try container.decode(String.self, forKey: .jobtitle)
        favouriteColor = try container.decode(String.self, forKey: .favouriteColor)
        id = try container.decode(String.self, forKey: .id)
      

    }
}
