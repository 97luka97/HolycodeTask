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
