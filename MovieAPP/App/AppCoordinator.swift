//
//  AppCoordinator.swift
//  CoordinatorExample
//
//  Created by Aslanli Faqan on 13.12.24.
//

import Foundation
import UIKit.UINavigationController

final class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    // burada userDefaults'dan istifade edirik
    var isLogin: Bool = false
    init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
        setupObserver()
    }
    
    private func setupObserver() {
        NotificationCenter
            .default
            .addObserver(
                self,
                selector: #selector(listener),
                name: NSNotification.Name("auth.session.exp"),
                object: nil
            )
    }
    
    func start() {
        if isLogin {
            showHome()
        } else {
            showAuth()
        }
    }
    
    deinit {
        NotificationCenter.default
            .removeObserver(
                self,
                name:  NSNotification.Name(
                    "auth.session.exp"
                ),
                object: nil
            )
    }
    
    fileprivate func showAuth() {
        navigationController.setViewControllers([], animated: false)
        let coordinator = AuthCoordinator.init(navigationController: navigationController)
        /// Remove all children, because this is a top level coordinator.
        children.removeAll()
        
        coordinator.parentCoordinator = self
        children.append(coordinator)
        coordinator.delegate = self
        coordinator.start()
    }
    
    fileprivate func showHome() {
        // Initiate HomeTabBar Coordinator
        navigationController.setViewControllers([], animated: false)
        let coordinator = HomeTabBarCoordinator.init(navigationController: navigationController)
        // Remove all children, because this is a top level coordinator.
        children.removeAll()
        coordinator.parentCoordinator = self
        children.append(coordinator)
        coordinator.start()
    }
    
    @objc
    private func listener() {
        print(#function)
        
        DispatchQueue.main.async {

            self.showAuth()
        }
    }
}

extension AppCoordinator: AuthCoordinatorDelegate {
    func changeRoot() {
        isLogin = true
        start()
    }
}
