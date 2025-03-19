//
//  UsersCoordinatorViewModel.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import Foundation
import Combine

public final class UsersCoordinatorViewModel: ObservableObject {
    @Published var path = [UsersCoordinatorViewModel.Route]()
    public let navigationSender = PassthroughSubject<UsersCoordinatorViewModel.Events, Never>()
    private var cancellable: AnyCancellable?
    
    unowned var usersComponent: UsersComponentProtocol
    let dependencyContainer: UsersDependencyProtocol
    
    public init(userComponent: UsersComponentProtocol, dependencyContainer: UsersDependencyProtocol) {
        self.usersComponent = userComponent
        self.dependencyContainer = dependencyContainer
        bind()
    }
    
    private func bind() {
        cancellable = navigationSender.receive(on: RunLoop.main).sink(receiveValue: { [weak self] event in
            guard let self else { return }
            switch event {
            case .back:
                self.path.removeLast()
                
            case .open(let route):
                self.path.append(route)
                self.objectWillChange.send()
            }
        })
    }
}

extension UsersCoordinatorViewModel {
    public enum Route: Hashable {
        case user(user: UserModel)
    }
    
    public enum Events {
        case back
        case open(route: Route)
    }
}
