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
    users = "https://randomuser.me/api?"
}

enum APIPath: Equatable {
    
    case
    getUsers(_ page: Int)
    
    var path: String {
        switch self {
        case .getUsers(let page):
            return "page=\(page)&results=20"
        }
    }
}
