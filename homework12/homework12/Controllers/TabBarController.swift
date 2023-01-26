//
//  TabBarController.swift
//  homework12
//
//  Created by Mikhail Chuparnov on 24.01.2023.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.unselectedItemTintColor = .lightGray
        self.tabBar.tintColor = .systemTeal
        self.tabBar.backgroundColor = #colorLiteral(red: 0.1163231064, green: 0.107940051, blue: 0.1184733386, alpha: 1)
        let vcArray = [
        setupTabBar(viewController: ViewController(), title: "Купить", image: "laptopcomputer.and.iphone"),
        setupTabBar(viewController: ForYouViewController(), title: "Для вас", image: "person.crop.circle"),
        setupTabBar(viewController: SearchViewController(), title: "Поиск", image: "magnifyingglass"),
        setupTabBar(viewController: ViewController(), title: "Корзина", image: "bag"),
        ]
        self.viewControllers = vcArray
    }

    
    private func setupTabBar(viewController: UIViewController, title: String, image: String) -> UIViewController {
        let vc = UINavigationController(rootViewController: viewController)
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(systemName: image)
        return vc
        
    }
}
