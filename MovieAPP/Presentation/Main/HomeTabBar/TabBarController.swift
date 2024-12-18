//
//  TabBarController.swift
//  MovieAPP
//
//  Created by Aslanli Faqan on 18.12.24.
//

import UIKit
final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    fileprivate func configureUI() {
        view.backgroundColor = .white
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white
        tabBar.tintColor = .red
        tabBar.unselectedItemTintColor = .red
        tabBar.tintColor = .red
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        tabBar.layer.masksToBounds = true
        UITabBarItem.appearance()
            .setTitleTextAttributes(
                [NSAttributedString.Key.foregroundColor: UIColor.black],
                for: .normal
            )
        UITabBarItem.appearance()
            .setTitleTextAttributes(
                [NSAttributedString.Key.foregroundColor: UIColor.black],
                for: .selected
            )
        delegate = self
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(
        _ tabBarController: UITabBarController,
        shouldSelect viewController: UIViewController
    ) -> Bool {
        return true
    }
}
