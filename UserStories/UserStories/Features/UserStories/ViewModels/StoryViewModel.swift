//
//  StoryViewModel.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import Foundation
import Combine

final class StoryViewModel: ObservableObject, Identifiable {
    @Published var isViewed: Bool = false
    @Published var isLiked: Bool = false
    let dependencyContainer: UsersDependencyProtocol
    var cancellable: AnyCancellable?
    
    var id: Int {
        storyModel.id
    }
    
    let storyModel: StoryModel
    let userModel: UserModel
    
    init(storyModel: StoryModel, userModel: UserModel, isViewed: Bool, isLiked: Bool, dependencyContainer: UsersDependencyProtocol) {
        self.storyModel = storyModel
        self.userModel = userModel
        self.isViewed = isViewed
        self.isLiked = isLiked
        self.dependencyContainer = dependencyContainer
        
        cancellable = $isLiked.sink { [weak self] isLiked in
            guard let self = self else { return }
            if isLiked {
                self.dependencyContainer.likedStories.append(self.storyModel.id)
            } else {
                self.dependencyContainer.likedStories.removeAll { $0 == self.storyModel.id }
            }
        }
    }
}

extension StoryViewModel: Hashable, Equatable {
    static func == (lhs: StoryViewModel, rhs: StoryViewModel) -> Bool {
        lhs.storyModel.id == rhs.storyModel.id
    }
    
    func hash(into hasher: inout Hasher) {
        storyModel.id.hash(into: &hasher)
    }
}
