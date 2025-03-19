//
//  UsersServiceProtocol.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import Foundation

public protocol UsersServiceProtocol {
    func getUsers(page: Int) async throws -> BasePaginatedResponseModel<UserModel>
    func getStories(page: Int) async throws -> BasePaginatedResponseModel<StoryModel>
}
