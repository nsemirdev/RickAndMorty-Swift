//
//  SceneDelegate.swift
//  RickAndMorty-Swift
//
//  Created by Emir Alkal on 26.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        window?.rootViewController = makeNavController()
    }
    
    private func makeNavController() -> UINavigationController {
        let navController = UINavigationController(rootViewController: ViewController())
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }

}

