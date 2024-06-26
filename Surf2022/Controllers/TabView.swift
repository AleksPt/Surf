//
//  TabBar.swift
//  Surf2022
//
//  Created by Алексей on 26.06.2024.
//

import UIKit

final class TabView: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = setupViewControllers(
            HomeViewController(),
            title: "Главная",
            image: "home-line"
        )
        
        let favoriteVC = setupViewControllers(
            FavoriteViewController(),
            title: "Избранное",
            image: "heart-line"
        )
        
        let profileVC = setupViewControllers(
            ProfileViewController(),
            title: "Профиль",
            image: "emotion-line"
        )
        
        self.viewControllers = [homeVC, favoriteVC, profileVC]
        tabBar.tintColor = .black
        navigationItem.hidesBackButton = true
    }

    private func setupViewControllers(
        _ vc: UIViewController,
        title: String,
        image: String
    ) -> UIViewController {
        let vc = UINavigationController(rootViewController: vc)
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(named: image)
        return vc
    }
}
