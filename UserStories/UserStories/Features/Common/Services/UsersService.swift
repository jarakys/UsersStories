//
//  UsersService.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import Foundation

public final class UsersService: UsersServiceProtocol {
    private let networkService: NetworkService
    
    public init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    public func getUsers(page: Int) async throws -> BasePaginatedResponseModel<UserModel> {
        let requestDescriptor = GetUsersDescriptor(page: page)
        return try await networkService.makeRequest(descriptor: requestDescriptor)
    }
    
    public func getStories(page: Int) async throws -> BasePaginatedResponseModel<StoryModel> {
        let requestDescriptor = GetStoriesDescriptor(page: page)
        return try await networkService.makeRequest(descriptor: requestDescriptor)
    }
}
