//
//  LoginViewModel.swift
//  MovieAPP
//
//  Created by Aslanli Faqan on 27.12.24.
//

import Foundation
final class LoginViewModel {
    enum ViewState {
        case loading
        case loaded
        case success
        case error
    }
    private weak var navigation: AuthNavigation?
    
    var requestCallBack: ((ViewState) -> Void)?
    
    init(navigation: AuthNavigation) {
        self.navigation = navigation
    }
}
