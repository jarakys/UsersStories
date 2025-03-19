//
//  StoryCircleView.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import SwiftUI

struct StoryCircleView: View {
    @StateObject var story: StoryViewModel
    
    var body: some View {
        VStack {
            CircleUserView(url: story.userModel.profilePictureUrl)
                .padding(.all, 2)
                .background(story.isViewed ? Color.gray : Color.red)
                .clipShape(Circle())
        }
    }
}
