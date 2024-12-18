//
//  TrendingUseCase.swift
//  MovieAPP
//
//  Created by Aslanli Faqan on 18.12.24.
//

import Foundation
protocol TrendingUseCase {
    func getTrendingMovie(timeInterval: String, completion: @escaping(MovieDTO?, String?) -> Void?)
}
