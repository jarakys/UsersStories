//
//  UserStoriesView.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import SwiftUI
import CompositionalList

struct UserStoriesView: View {
    @StateObject var viewModel: UserStoriesViewModel
    
    var body: some View {
        CompositionalList([viewModel.section]) { model, indexPath in
            StoryCircleView(story: model)
                .onAppear {
                    if model == viewModel.section.cellIdentifiers.last, viewModel.canLoadMore {
                        viewModel.pageLoading()
                    }
                }
                .onTapGesture {
                    viewModel.clickStory(story: model)
                }
        }.sectionHeader { sectionIdentifier, kind, indexPath in
            EmptyView()
        }
        .selectedItem { _ in
            
        }
        .customLayout(.composed())
        .fullScreenCover(item: $viewModel.selectedStory, content: { story in
            FullScreenStoryView(storyViewModel: story)
        })
    }
}
