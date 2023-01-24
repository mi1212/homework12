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
        self.view.backgroundColor =  .systemGray6
        self.tabBar.tintColor = .systemTeal
        let vcArray = [
        setupTabBar(viewController: ViewController(), title: "Купить", image: "laptopcomputer.and.iphone"),
        setupTabBar(viewController: ViewController(), title: "Для вас", image: "person.crop.circle"),
        setupTabBar(viewController: ViewController(), title: "Поиск", image: "magnifyingglass"),
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
