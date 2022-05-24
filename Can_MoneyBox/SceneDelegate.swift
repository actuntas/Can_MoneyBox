//
//  SceneDelegate.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var coordinator: MainCoordinator?
    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = scene
        window?.overrideUserInterfaceStyle = .dark
        
        let navController = UINavigationController()
        navController.setNavigationBarHidden(true, animated: false)
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.tintColor = .systemPink
        coordinator = MainCoordinator(navigationController: navController)
        coordinator?.start()
        
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
    }

}

