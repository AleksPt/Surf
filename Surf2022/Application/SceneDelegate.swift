//
//  SceneDelegate.swift
//  Surf2022
//
//  Created by Алексей on 19.06.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(vcRout),
            name: NSNotification.Name(K.NotificationKey.login),
            object: nil
        )
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: LoginViewController())
        window?.makeKeyAndVisible()
    }
    
    @objc private func vcRout(notification: Notification) {
        let loginVC = UINavigationController(rootViewController: LoginViewController())
        let tabView = TabView()
        
        guard let vc = notification.userInfo?[K.NotificationKey.login] as? Bool else { return }
        self.window?.rootViewController = vc ? tabView : loginVC
    }
}

