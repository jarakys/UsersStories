//
//  BasePaginatedResponseModel.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import Foundation

public struct BasePaginatedResponseModel<T: Codable>: Codable {
    public let data: [T]
    public let page: Int
    public let pageCount: Int
}
