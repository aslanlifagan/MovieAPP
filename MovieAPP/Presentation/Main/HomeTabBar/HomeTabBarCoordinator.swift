//
//  HomeTabBarCoordinator.swift
//  MovieAPP
//
//  Created by Aslanli Faqan on 18.12.24.
//

import UIKit
final class HomeTabBarCoordinator : Coordinator {
    
    weak var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    private let tabBarController = TabBarController()
    
    private var homeCoordinator: HomeCoordinator?
//    private var orderCoordinator: OrderCoordinator?
//    private var jewelryCoordinator: JewelryCoordinator?
//    private var searchCoordinator: SearchCoordinator?
//    private var profileCoordinator: ProfileCoordinator?
    
    init(
        navigationController : UINavigationController
    ) {
        self.navigationController = navigationController
    }
    
    func start() {
        initializeHomeTabBar()
    }
    
    deinit {
        print(#function)
    }
    
    private func initializeHomeTabBar() {
        //MARK: Create the TabBar item for TabBar.
        let homeNavigationController = UINavigationController()
        homeCoordinator = HomeCoordinator(navigationController: homeNavigationController)
        // we want to home coordinator connected to the App Coordinator, because the HomeTabBar coordinator only serves as a container.
        homeCoordinator?.parentCoordinator = parentCoordinator
        // Setup for home tab
        let homeItem = UITabBarItem()
        homeItem.title = "Home"
        homeItem.image = UIImage(systemName: "house")
        homeItem.selectedImage = UIImage(systemName: "house.fill")
        homeNavigationController.tabBarItem = homeItem
        
        
        tabBarController.viewControllers = [
            homeNavigationController
        ]
        
        navigationController.pushViewController(tabBarController, animated: true)
//        navigationController.setNavigationBarHidden(false, animated: true)
        
        // Add the coordinator into parent's child
        parentCoordinator?.children.append(
            homeCoordinator ?? HomeCoordinator(navigationController: UINavigationController())
        )
        homeCoordinator?.start()
    }
}
