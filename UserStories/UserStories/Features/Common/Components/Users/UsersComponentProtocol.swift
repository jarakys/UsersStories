//
//  UsersComponentProtocol.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import Foundation

public protocol UsersComponentProtocol: AnyObject {
    func makeUsersView() -> UsersView
    func makeRoot() -> UsersCoordinatorView
    var usersViewModel: UsersViewModel { get }
    var usersCoordinatorViewModel: UsersCoordinatorViewModel { get }
}
