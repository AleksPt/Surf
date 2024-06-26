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
            title: K.Text.TitleVC.homeVC,
            image: K.Image.home
        )
        
        let favoriteVC = setupViewControllers(
            FavoriteViewController(),
            title: K.Text.TitleVC.favoriteVC,
            image: K.Image.heartLine
        )
        
        let profileVC = setupViewControllers(
            ProfileViewController(),
            title: K.Text.TitleVC.profileVC,
            image: K.Image.emotion
        )
        
        self.viewControllers = [homeVC, favoriteVC, profileVC]
        tabBar.tintColor = .black
        navigationItem.hidesBackButton = true
    }

    private func setupViewControllers(
        _ vc: UIViewController,
        title: String,
        image: UIImage
    ) -> UIViewController {
        let vc = UINavigationController(rootViewController: vc)
        vc.tabBarItem.title = title
        vc.tabBarItem.image = image
        return vc
    }
}
