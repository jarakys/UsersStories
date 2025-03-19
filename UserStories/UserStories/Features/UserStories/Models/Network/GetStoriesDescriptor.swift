//
//  GetStoriesDescriptor.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import Foundation

public struct GetStoriesDescriptor: RequestDescriptor {
    let page: Int
    public let method: String = "GET"
    public let headers: [String : String] = [:]
    public let body: Data? = nil
    public let parameters: [String : Any]? = nil
    public var url: URL {
        get throws {
            guard let url = URL(string: "https://raw.githubusercontent.com/jarakys/API/refs/heads/main/story\(page)2.json") else {
                throw NetworkError.unknown(error: URLError(.badURL))
            }
            return url
        }
    }
}
