//
//  APIRoutes.swift
//  holycodeTask-ios
//
//  Created by Kostic on 11/11/19.
//  Copyright © 2019 Kostic. All rights reserved.
//

import Foundation

enum BaseURL: String {
    case
    users = "https://randomuser.me/api?",
    flag = "https://www.countryflags.io/"
}

enum APIPath {
    
    case
    getUsers(_ page: Int),
    getFlag(_ country: String, size: Int)
    
    var path: String {
        switch self {
        case .getUsers(let page):
            return "page=\(page)&results=20"
        case .getFlag(let countryCode, let size):
            return "\(countryCode)/shiny/\(size).png"
        }
    }
}
