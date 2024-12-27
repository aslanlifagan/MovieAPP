//
//  LoginController.swift
//  MovieAPP
//
//  Created by Aslanli Faqan on 27.12.24.
//

import Foundation
final class LoginController: BaseViewController {
    private let viewModel: LoginViewModel
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        view.backgroundColor = .red
    }
}
