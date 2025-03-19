//
//  NetworkService.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import Foundation

public final class NetworkService {
    lazy var session: URLSession = {
        return URLSession(configuration: .ephemeral)
    }()
    
    
    public init() {
        
    }
    
    public func makeRequest<T: Decodable>(descriptor: RequestDescriptor) async throws -> T {
        let request = try descriptor.makeRequest()
        let response = try await session.data(for: request)
        return try JSONDecoder().decode(T.self, from: response.0)
    }
}
