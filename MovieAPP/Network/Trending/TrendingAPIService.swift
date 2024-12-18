//
//  TrendingAPIService.swift
//  MovieAPP
//
//  Created by Aslanli Faqan on 18.12.24.
//

import Foundation
final class TrendingAPIService: TrendingUseCase {
    private let apiService = CoreAPIManager.instance
    func getTrendingMovie(
        timeInterval: String,
        completion: @escaping (MovieDTO?, String?) -> Void?
    ) {
        apiService.request(
            type: MovieDTO.self,
            url: TrendingHelper.all(timeInterval).endPoint,
            method: .GET
        ) { [weak self] result in
                guard let _ = self else {return}
                switch result {
                    case .success(let data):
                        completion(data, nil)
                    case .failure(let error):
                        completion(nil, error.localizedDescription)
                }
            }
    }
    
}
