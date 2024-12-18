//
//  HomeController.swift
//  MovieAPP
//
//  Created by Aslanli Faqan on 18.12.24.
//

import UIKit

final class HomeController: BaseViewController {
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }
}

//class TabBarController: UITabBarController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupControllers()
//    }
//    
//    fileprivate func setupControllers() {
//        
//        let mainController = MainViewController(viewModel: MainViewModel())
//        let quizController = QuizController(viewModel: QuizViewModel())
//        let profileController = ProfileController(viewModel: ProfileViewModel())
//        
//        let nav1 = UINavigationController(rootViewController: mainController)
//        let nav2 = UINavigationController(rootViewController: quizController)
//        let nav3 = UINavigationController(rootViewController: profileController)
//        
//        nav1.tabBarItem = UITabBarItem(title: "Countries", image: UIImage(systemName: "map.circle"), tag: 1)
//        nav2.tabBarItem = UITabBarItem(title: "Quiz", image: UIImage(systemName: "questionmark.bubble"), tag: 2)
//        nav3.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 3)
//        
//        setViewControllers([nav1, nav2, nav3], animated: true)
//        
//    }
//}
