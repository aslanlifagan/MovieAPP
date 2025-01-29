//
//  TrendingSpyAPIService.swift
//  MovieAPP
//
//  Created by Aslanli Faqan on 29.01.25.
//

import Foundation

final class TrendingSpyAPIService: TrendingUseCase {
    
    private let mockManager: MockManager
    
    init(mockManager: MockManager) {
        self.mockManager = mockManager
    }
    
    func getTrendingMovie(
        timeInterval: String,
        completion: @escaping (MovieDTO?, String?) -> Void?
    ) {
        mockManager.loadJson(fileName: "TrendingAll", type: MovieDTO.self) { [ weak self ] dto, error in
            guard let self else {return}
            if let error = error {
                completion(nil, error)
            } else if let dto = dto {
                completion(dto, nil)
            } else {
                completion(nil, nil)
            }
        }
    }
}
