//
//  AuthCoordinator.swift
//  MovieAPP
//
//  Created by Aslanli Faqan on 27.12.24.
//

import Foundation
import UIKit.UINavigationController

final class AuthCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = LoginController(viewModel: .init(navigation: self))
        showController(vc: controller)
    }
}

//MARK: AuthNavigation

extension AuthCoordinator: AuthNavigation {
    func showRegister() {
        print(#function)
    }
     
    func showHome() {
        let coor = parentCoordinator as! AppCoordinator
        coor.isLogin = true // bunu userdefault'da deyishmeliyik
        coor.start()
    }
}
