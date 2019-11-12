//
//  SceneDelegate.swift
//  holycodeTask-ios
//
//  Created by Kostic on 11/11/19.
//  Copyright © 2019 Kostic. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let _ = (scene as? UIWindowScene) else { return }
        
        setRootController(window: window ?? UIWindow(frame: UIScreen.main.bounds))
    }

    // MARK: - Private methods

    private func setRootController(window: UIWindow) {
        let coordinator = AppCoordinator(window: window)
        coordinator.start()
    }
    
}

