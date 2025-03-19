//
//  UsersViewModel.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import Foundation
import Combine

public final class UsersViewModel: BaseViewModel, ObservableObject {
    @Published var users: [UserModel] = []

    let service: UsersServiceProtocol
    let asyncPageLoader: AsyncPageLoader<UserModel>
    let navigationSender: PassthroughSubject<UsersCoordinatorViewModel.Events, Never>
    
    var canLoadMore: Bool {
        asyncPageLoader.canLoadMore
    }
    
    init(service: UsersServiceProtocol,
         navigationSender: PassthroughSubject<UsersCoordinatorViewModel.Events, Never>) {
        self.service = service
        self.navigationSender = navigationSender
        asyncPageLoader = .init(fetchPage: service.getUsers)
        super.init()
        initialUsersLoading()
    }
    
    func userClicked(user: UserModel) {
        navigationSender.send(.open(route: .user(user: user)))
    }
    
    func initialUsersLoading() {
        screenState = .loading
        Task.detached(operation: { [weak self] in
            guard let self = self else { return }
            do {
                try await loadUsers()
            } catch {
                await handleError(error: error)
            }
        })
    }
    
    func pageLoading() {
        guard screenState == .loaded else { return }
        screenState = .pageLoading
        Task.detached(operation: { [weak self] in
            guard let self = self else { return }
            do {
                try await self.loadUsers()
            } catch {
                await self.handleError(error: error)
            }
        })
    }
    
    func loadUsers() async throws {
        let tmpUsers = try await asyncPageLoader.loadNextPage()
        await MainActor.run(body: {
            self.users.append(contentsOf: tmpUsers)
            print(tmpUsers)
            self.screenState = .loaded
        })
    }
}
