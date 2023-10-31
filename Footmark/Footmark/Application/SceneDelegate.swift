//
//  SceneDelegate.swift
//  Footmark
//
//  Created by 박신영 on 10/10/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let vc = CalendarViewController()
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.navigationBar.isHidden = false
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}
