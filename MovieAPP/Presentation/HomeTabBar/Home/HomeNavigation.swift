//
//  HomeNavigation.swift
//  MovieAPP
//
//  Created by Aslanli Faqan on 10.01.25.
//

import Foundation

protocol HomeNavigation: AnyObject {
    func showMovieDetail(detail: MovieDetail)
    func showTrailer(url: String)
}
