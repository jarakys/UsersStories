//
//  UserStoriesViewModel.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import Foundation

final class UserStoriesViewModel: BaseViewModel, ObservableObject {
    let usersService: UsersServiceProtocol
    @Published var stories: [StoryViewModel] = []
    @Published var selectedStory: StoryViewModel?
    let asyncPageLoader: AsyncPageLoader<StoryModel>
    let userModel: UserModel
    let section = GenericSectionIdentifierModel(sectionIdentifier: "items", cellIdentifiers: [StoryViewModel]())
    let dependencyContainer: UsersDependencyProtocol
    
    var canLoadMore: Bool {
        asyncPageLoader.canLoadMore
    }
    
    //We need add userId here, but for test we use one set of stories for all users
    init(usersService: UsersServiceProtocol, userModel: UserModel, dependencyContainer: UsersDependencyProtocol) {
        self.usersService = usersService
        self.asyncPageLoader = .init(fetchPage: usersService.getStories)
        self.userModel = userModel
        self.dependencyContainer = dependencyContainer
        super.init()
        initialStoriesLoading()
    }
    
    func initialStoriesLoading() {
        screenState = .loading
        Task.detached { [weak self] in
            guard let self = self else { return }
            do {
                try await self.loadStories()
            } catch {
                await self.handleError(error: error)
            }
        }
    }
    
    func pageLoading() {
        guard screenState == .loaded else { return }
        screenState = .pageLoading
        Task.detached { [weak self] in
            guard let self = self else { return }
            do {
                try await self.loadStories()
            } catch {
                await self.handleError(error: error)
            }
        }
    }
    
    func loadStories() async throws {
        let tmpStories = try await asyncPageLoader.loadNextPage()
        let wrappedStories = tmpStories.map { story in
            let isViewed = dependencyContainer.viewedStories.contains(story.id)
            let isLiked = dependencyContainer.likedStories.contains(story.id)
            return StoryViewModel(storyModel: story,
                                  userModel: userModel,
                                  isViewed: isViewed,
                                  isLiked: isLiked,
                                  dependencyContainer: dependencyContainer)
        }
        
        await MainActor.run {
            self.section.cellIdentifiers.append(contentsOf: wrappedStories)
            self.screenState = .loaded
        }
    }
    
    func clickStory(story: StoryViewModel) {
        selectedStory = story
        selectedStory?.isViewed = true
        dependencyContainer.viewedStories.insert(story.storyModel.id)
    }
}
