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
//        mainVC.tabBarItem.selectedImage = UIImage(systemName: Image.mainPageImageFill)
        
        let favoriteVC = setupViewControllers(
            FavoriteViewController(),
            title: "Избранное",
            image: "heart-line"
        )
//        catalogVC.tabBarItem.selectedImage = UIImage(systemName: Image.catalogImageFill)
        
        let profileVC = setupViewControllers(
            ProfileViewController(),
            title: "Профиль",
            image: "emotion-line"
        )
//        cartVC.tabBarItem.selectedImage = UIImage(systemName: Image.cartImageFill)
        
        self.viewControllers = [homeVC, favoriteVC, profileVC]
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
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
    
    @objc private func goToMain() {
        self.selectedIndex = 0
    }
}
