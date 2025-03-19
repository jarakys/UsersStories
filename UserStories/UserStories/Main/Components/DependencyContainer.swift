//
//  DependencyContainer.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import Foundation

final class DependencyContainer: UsersDependencyProtocol {
    var likedStories: [Int] = []
    var viewedStories: Set<Int> = []
    
    lazy var networkService: NetworkService = {
        return NetworkService()
    }()
    
    lazy var usersService: any UsersServiceProtocol = {
        return UsersService(networkService: networkService)
    }()
}
