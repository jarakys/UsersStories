//
//  UsersCoordinatorView.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import SwiftUI

public struct UsersCoordinatorView: View {
    @StateObject var viewModel: UsersCoordinatorViewModel
    
    init(viewModel: UsersCoordinatorViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    public var body: some View {
        NavigationStack(path: $viewModel.path, root: {
            viewModel.usersComponent.makeUsersView()
                .navigationDestination(for: UsersCoordinatorViewModel.Route.self, destination: { route in
                    switch route {
                    case .user(let user):
                        UserStoriesView(viewModel: .init(usersService: viewModel.usersComponent.usersViewModel.service, userModel: user,
                                                         dependencyContainer: viewModel.dependencyContainer))
                    }
                })
        })
    }
}
