//
//  User.swift
//  holycodeTask-ios
//
//  Created by Kostic on 11/11/19.
//  Copyright © 2019 Kostic. All rights reserved.
//

import Foundation

struct User: Codable {
    
    let name: Name
    let dob: Dob
    let picture: Picture
    let email: String
    let gender: String
    let nat: String
}

extension User {
    
    enum CodingKeys: String, CodingKey {
        case name
        case dob
        case picture
        case email
        case gender
        case nat
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        email = try container.decode(String.self, forKey: .email)
        gender = try container.decode(String.self, forKey: .gender)
        nat = try container.decode(String.self, forKey: .nat)
        name = try container.decode(Name.self, forKey: .name)
        dob = try container.decode(Dob.self, forKey: .dob)
        picture = try container.decode(Picture.self, forKey: .picture)
    }
}

struct Name: Codable {
    
    let firstName: String
    let lastName: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first"
        case lastName = "last"
        case title
    }
}

struct Dob: Codable {
    
    let date: String
    let age: Int
    
    enum CodingKeys: String, CodingKey {
        case date
        case age
    }
}

struct Picture: Codable {
    
    let large: String
    let medium: String
    let thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case large
        case medium
        case thumbnail
    }
}
