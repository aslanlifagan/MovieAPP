//
//  MockManager.swift
//  MovieAPP
//
//  Created by Aslanli Faqan on 29.01.25.
//

import Foundation

enum MockError: Error {
    case fileError
}

protocol MockUseCase {
    func loadJson<T: Decodable>(fileName: String, type: T.Type, completion: ((T?, String?) -> Void))
}

final class MockManager: MockUseCase {
    
    func loadJson<T: Decodable>(
        fileName: String,
        type: T.Type,
        completion: ((T?, String?) -> Void)
    ){
        guard let file = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            completion(nil, MockError.fileError.localizedDescription)
            return
        }
        guard let data = try? Data(contentsOf: file) else { return }
        
        do {
            let model = try JSONDecoder().decode(type, from: data)
            completion(model, nil)
        }
        catch {
            completion(nil, error.localizedDescription)
            print("error")
        }
    }
}
