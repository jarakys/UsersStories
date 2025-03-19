//
//  RequestDescriptor.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import Foundation

public protocol RequestDescriptor {
    var url: URL { get throws }
    var method: String { get }
    var headers: [String: String] { get }
    var body: Data? { get }
    var parameters: [String: Any]? { get }
    
    func makeRequest() throws -> URLRequest
}

public extension RequestDescriptor {
    func makeRequest() throws -> URLRequest {
        // 1. Проверяем и разворачиваем URL, если он nil — выбрасываем ошибку или возвращаем пустой запрос
        let url = try url
    
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let parameters = parameters, !parameters.isEmpty {
            var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
            urlComponents?.queryItems = parameters.map { key, value in
                URLQueryItem(name: key, value: String(describing: value))
            }
            if let updatedURL = urlComponents?.url {
                request.url = updatedURL
            }
        }
        
        if let body = body {
            request.httpBody = body
        }
        
        return request
    }
}
