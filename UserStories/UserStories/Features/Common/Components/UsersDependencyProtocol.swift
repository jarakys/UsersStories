//
//  UsersDependencyProtocol.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import Foundation

public protocol UsersDependencyProtocol: AnyObject {
    var usersService: UsersServiceProtocol { get }
    var likedStories: [Int] { get set }
    var viewedStories: Set<Int> { get set }
}
