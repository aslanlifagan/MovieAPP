//
//  MovieDetailViewModel.swift
//  MovieAPP
//
//  Created by Aslanli Faqan on 10.01.25.
//

import Foundation

final class MovieDetailViewModel {
    enum ViewState {
        case loading
        case loaded
        case success
        case error(String)
    }
    private weak var navigation: HomeNavigation?
    
    var requestCallBack: ((ViewState) -> Void)?
    private let movieDetail: MovieDetail
    init(
        navigation: HomeNavigation,
        movieDetail: MovieDetail
    ) {
        self.navigation = navigation
        self.movieDetail = movieDetail
        print(movieDetail)
    }
    
    func getDetail() -> MovieDetail {
        movieDetail
    }
    
    func request() {
//        requestCallBack?(.loading)
//        requestCallBack?(.loaded)
//        requestCallBack?(.error(error.localizedDescription))
//        requestCallBack?(.success)

    }
    
    //MARK: Coordinator

    func showTrailer() {
        navigation?.showTrailer(url: "https://www.youtube.com/watch?v=MbKeytYuJRA&t=1s")
    }
}
