//
//  CoreAPIManager.swift
//  URLSession
//
//  Created by Aslanli Faqan on 22.11.24.
//

import Foundation
final class CoreAPIManager {
    static let instance = CoreAPIManager()
    private init() {}
    
    func request<T: Decodable>(
        type: T.Type,
        url: URL?,
        header: [String: String] = CoreAPIHelper.instance.makeHeader(),
        body: [String: Any] = [:],
        method: HttpMethods,
        completion: @escaping((Result<T,CoreErrorModel>) -> Void)
    ) {
        guard let url = url else {return}
        print("URL:", url)
        let session = URLSession.shared
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        if !body.isEmpty {
            let bodyData = try? JSONSerialization.data(withJSONObject: body, options: [])
            request.httpBody = bodyData
            print("body: \(String(data: try! JSONSerialization.data(withJSONObject: body, options: .prettyPrinted), encoding: .utf8)!)")
        }
        
        
        request.allHTTPHeaderFields = header
        print("header: \(header)")
        
        let dataTask = session.dataTask(with: request) { [weak self] data, response, error in
            let statusCode = (response as! HTTPURLResponse).statusCode
            print("responseCode: \(statusCode)")
            if statusCode == 401 {
                completion(.failure(CoreErrorModel.authError(code: statusCode)))
                return
            }
            
            guard let self = self else {return}
            if let _ = error {
                completion(.failure(CoreErrorModel.generalError()))
            } else if let data = data {
                self.handleResponse(data: data) { response in
                    completion(response)
                }
            } else {
                completion(.failure(CoreErrorModel.generalError()))
            }
        }
        
        DispatchQueue.global(qos: .background).async {
            dataTask.resume()
        }
    }
    
    fileprivate func handleResponse<T: Decodable>(
        data: Data,
        completion: @escaping((Result<T,CoreErrorModel>) -> Void)
    ) {
        do {
            let response = try JSONDecoder().decode(T.self, from: data)
            print("Response:",response)
            completion(.success(response))
        }
        catch {
            completion(.failure(CoreErrorModel.decodingError()))
        }
    }
}
