//
//  UsersComponent.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import SwiftUI

public final class UsersComponent: UsersComponentProtocol {
    let usersDependency: UsersDependencyProtocol
    
    init(usersDependency: UsersDependencyProtocol) {
        self.usersDependency = usersDependency
    }
    
    @ViewBuilder
    public func makeRoot() -> UsersCoordinatorView {
        UsersCoordinatorView(viewModel: self.usersCoordinatorViewModel)
    }
    
    @ViewBuilder
    public func makeUsersView() -> UsersView {
        UsersView(viewModel: self.usersViewModel)
    }
    
    public lazy var usersViewModel: UsersViewModel = makeUsersViewModel()
    
    public lazy var usersCoordinatorViewModel: UsersCoordinatorViewModel = { makeUsersCoordinatorViewModel() }()
    
    private func makeUsersCoordinatorViewModel() -> UsersCoordinatorViewModel {
        UsersCoordinatorViewModel(userComponent: self, dependencyContainer: usersDependency)
    }
    
    private func makeUsersViewModel() -> UsersViewModel {
        UsersViewModel(service: usersDependency.usersService,
                       navigationSender: usersCoordinatorViewModel.navigationSender)
    }
}
