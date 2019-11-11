//
//  UsersRepository.swift
//  holycodeTask-ios
//
//  Created by Kostic on 11/11/19.
//  Copyright © 2019 Kostic. All rights reserved.
//

import Foundation

struct UsersRepository {
    
    func loadFromAPI(page: Int, completion: @escaping ([User], String?) -> Void) {
        ApiManager.shared.sendRequest(UsersListRequest(page)) { (result) in
            switch result {
            case .success(let data):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data["results"]!, options: .prettyPrinted)
                    let users = try JSONDecoder().decode([User].self, from: jsonData)
                    completion(users, nil)
                } catch {
                    completion([User](), error.localizedDescription)
                }
            case .error(let error):
                completion([User](), error)
                
            case .errorWithDictionary(let errorDictionary):
                print(errorDictionary)
                completion([User](), "error")
            }
        }
    }
    
}

