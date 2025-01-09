//
//  SceneDelegate.swift
//  Interviewer_app
//
//  Created by Kiri4of on 21/10/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let navigationViewController = UINavigationController()
        let appCoordinator = AppCoordinator(navigationController: navigationViewController)
        appCoordinator.start()
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navigationViewController // затычка
        window?.makeKeyAndVisible()
    }

}


