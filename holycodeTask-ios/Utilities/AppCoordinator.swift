//
//  AppCoordinator.swift
//  holycodeTask-ios
//
//  Created by Kostic on 11/11/19.
//  Copyright © 2019 Kostic. All rights reserved.
//

import Foundation

import UIKit

protocol Coordinatable {
    func start()
}

class AppCoordinator: NSObject, Coordinatable {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let usersTableViewController = UsersTableViewController.init(nibName: UsersTableViewController.name, bundle: nil)
        let navigationController = UINavigationController(rootViewController: usersTableViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}


struct UserDetailsCoordinator: Coordinatable {
    
    let navigationController: UINavigationController?
    let source: UIViewController
    let user: User
    
    init(navigationController: UINavigationController?, source: UIViewController, user: User) {
        self.navigationController = navigationController
        self.source = source
        self.user = user
    }
    
    func start() {
        let userDetails = UserDetailsTableViewController.init(nibName: UserDetailsTableViewController.name, bundle: nil)
        userDetails.user = user
        navigationController?.pushViewController(userDetails, animated: true)
    }
}
