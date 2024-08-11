//
//  TabBarController.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 11.08.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = setUp()
        configureTabBarAppearance()
    }
}

private extension TabBarController {
    func setUp() -> [UIViewController] {
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: SFSymbol.house.rawValue),
            tag: 0)

        let triagleVC = TriangleViewController()
        triagleVC.tabBarItem = UITabBarItem(
            title: "Triangle",
            image: UIImage(systemName: SFSymbol.camera.rawValue),
            tag: 1)

        return [
            homeVC, triagleVC
        ]
    }

    func configureTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()

        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
    }
}
