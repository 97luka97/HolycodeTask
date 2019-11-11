//
//  UsersListRequest.swift
//  holycodeTask-ios
//
//  Created by Kostic on 11/11/19.
//  Copyright © 2019 Kostic. All rights reserved.
//

import Foundation

struct UsersListRequest: ApiRequest {
    var baseUrl = BaseURL.users
    var path = APIPath.getUsers(1)
    var method = APIMethod.get
    var body = [String : Any]()
    var urlParams = [String: Any]()
    var requiredAuth = false
    
    init(_ page: Int) {
        self.path = APIPath.getUsers(page)
    }
}
