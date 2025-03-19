//
//  MainViewModel.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import Foundation

final class MainViewModel: ObservableObject {
    let dependencyContainer = DependencyContainer()
    let userComponent: UsersComponentProtocol
    
    init() {
        userComponent = UsersComponent(usersDependency: dependencyContainer)
    }
}
