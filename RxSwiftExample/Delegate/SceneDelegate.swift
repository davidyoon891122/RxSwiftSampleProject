//
//  SceneDelegate.swift
//  RxSwiftExample
//
//  Created by Jiwon Yoon on 11/7/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        let menuViewController = MenuViewController()
        window?.rootViewController = UINavigationController(rootViewController: menuViewController)
        window?.makeKeyAndVisible()
    }
}

