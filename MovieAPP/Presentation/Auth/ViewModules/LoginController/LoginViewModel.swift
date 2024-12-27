//
//  LoginViewModel.swift
//  MovieAPP
//
//  Created by Aslanli Faqan on 27.12.24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

final class LoginViewModel {
    enum ViewState {
        case loading
        case loaded
        case success
        case error(String)
    }
    private weak var navigation: AuthNavigation?
    
    var requestCallBack: ((ViewState) -> Void)?
    
    init(navigation: AuthNavigation) {
        self.navigation = navigation
    }
    
    func loginRequest(
        email: String,
        password: String
    ) {
        requestCallBack?(.loading)
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let self = self else { return }
            self.requestCallBack?(.loaded)
            if let error = error {
                requestCallBack?(.error(error.localizedDescription))
                return
            }
            guard let result = authResult else { return }
            requestCallBack?(.success)
        }
        
    }
    
    //MARK: Coordinator
    
    func showRegister() {
        navigation?.showRegister()
    }
    
    func showHome() {
        navigation?.showHome()
    }
}
