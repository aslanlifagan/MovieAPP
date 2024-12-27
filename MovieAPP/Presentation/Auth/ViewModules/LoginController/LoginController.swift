//
//  LoginController.swift
//  MovieAPP
//
//  Created by Aslanli Faqan on 27.12.24.
//

import UIKit
final class LoginController: BaseViewController {
    private let viewModel: LoginViewModel
    
    private lazy var emailField = UITextField().withUsing {
        $0.placeholder = "Email"
        $0.delegate = self
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
        $0.anchorSize(.init(width: 0, height: 48))
    }
    
    private lazy var passField = UITextField().withUsing {
        $0.placeholder = "Password"
        $0.delegate = self
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
        $0.anchorSize(.init(width: 0, height: 48))
    }
    
    private lazy var stackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [emailField, passField])
        s.alignment = .fill
        s.distribution = .fill
        s.axis = .vertical
        s.spacing = 12
        return s
    }()
    
    private lazy var loginButton = UIButton().withUsing {
        $0.setTitle("Login", for: .normal)
        $0.anchorSize(.init(width: 0, height: 48))
        $0.titleLabel?.textColor = .white
        $0.backgroundColor = .blue
    }
    
    private lazy var registerButton = UIButton().withUsing {
        $0.setTitle("Register", for: .normal)
        $0.anchorSize(.init(width: 0, height: 48))
        $0.titleLabel?.textColor = .white
        $0.backgroundColor = .clear
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
    }
    
    private lazy var buttonStackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [loginButton, registerButton])
        s.alignment = .fill
        s.distribution = .fill
        s.axis = .vertical
        s.spacing = 12
        return s
    }()
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureView() {
        super.configureView()
        view.addSubViews(stackView, buttonStackView)
    }
    
    override func configureConstraint() {
        super.configureConstraint()
        stackView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            padding: .init(all: 24)
        )
        
        buttonStackView.anchor(
            leading: view.leadingAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            trailing: view.trailingAnchor,
            padding: .init(all: 24)
        )
    }
    
    override func configureTargets() {
        super.configureTargets()
        loginButton.addTarget(self, action: #selector(loginButtonClicked) , for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonClicked), for: .touchUpInside)
    }
    
    @objc
    private func loginButtonClicked() {
        print(#function)
    }
    
    @objc
    private func registerButtonClicked() {
        print(#function)
    }
    
}


extension LoginController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else {return}
        switch textField {
            case emailField:
                print("Email:", text)
            case passField:
                print("pass:", text)
            default: return
        }
    }
}
