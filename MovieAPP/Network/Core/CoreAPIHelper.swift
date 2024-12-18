//
//  CoreAPIHelper.swift
//  URLSession
//
//  Created by Aslanli Faqan on 22.11.24.
//

import Foundation
enum HttpMethods: String {
    case GET
    case POST
    case PATCH
    case PUT
    case DELETE
}

enum BaseURL: String {
    case prod = "https://api.themoviedb.org/3/"
}

final class CoreAPIHelper {
    static let instance = CoreAPIHelper()
    private init() {}
    private let baseURL = BaseURL.prod.rawValue
    
    func makeURL(path: String) -> URL? {
        let urlString = baseURL + path
        return URL(string:urlString)
    }
    private let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZmZjOTk4YmQwMDNlYmY4NjExNjE4NzQzODgxODYxNCIsInN1YiI6IjY1ZGIxZTAyOWI2ZTQ3MDE4NjAwYWI4ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fzVDj8_nT9CH8dIMRHCSICGu-FnWbH08kvtYmY6m4ag"
    
    func makeHeader() -> [String: String] {
        return [
            "accept": "application/json",
            "Authorization": "Bearer \(token)"
        ]
    }
}
