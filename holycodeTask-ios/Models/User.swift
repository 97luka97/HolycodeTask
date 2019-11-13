//
//  User.swift
//  holycodeTask-ios
//
//  Created by Kostic on 11/11/19.
//  Copyright © 2019 Kostic. All rights reserved.
//

import Foundation

extension User: Equatable {
    
    public static func == (lhs: User, rhs: User) -> Bool {
        if lhs.name != rhs.name {
            return false
        }
        if lhs.dob != rhs.dob {
            return false
        }
        if lhs.picture != rhs.picture {
            return false
        }
        if lhs.email != rhs.email {
            return false
        }
        if lhs.name != rhs.name {
            return false
        }
        if lhs.gender != rhs.gender {
            return false
        }
        if lhs.nat != rhs.nat {
            return false
        }
        return true
    }
    
}

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

extension Name: Equatable {
    
    public static func == (lhs: Name, rhs: Name) -> Bool {
        if lhs.firstName != rhs.firstName {
            return false
        }
        if lhs.lastName != rhs.lastName {
            return false
        }
        if lhs.title != rhs.title {
            return false
        }
        return true
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

extension Dob: Equatable {
    
    public static func == (lhs: Dob, rhs: Dob) -> Bool {
        if lhs.date != rhs.date {
            return false
        }
        if lhs.age != rhs.age {
            return false
        }
        return true
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

extension Picture: Equatable {
    
    public static func == (lhs: Picture, rhs: Picture) -> Bool {
          if lhs.large != rhs.large {
              return false
          }
        if lhs.medium != rhs.medium {
            return false
        }
        if lhs.thumbnail != rhs.thumbnail {
            return false
        }
        return true
    }
    
}

struct Picture: Codable {
    
    let large: URL
    let medium: URL
    let thumbnail: URL
    
    enum CodingKeys: String, CodingKey {
        case large
        case medium
        case thumbnail
    }
}
