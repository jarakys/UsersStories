//
//  FullScreenStoryView.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import SwiftUI
import Kingfisher

struct FullScreenStoryView: View {
    @ObservedObject var storyViewModel: StoryViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            KFImage(URL(string: storyViewModel.storyModel.url))
                .resizable()
                .backgroundDecode(true)
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                Spacer()
                Button(action: {
                    storyViewModel.isLiked.toggle()
                }) {
                    Image(systemName: storyViewModel.isLiked ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(storyViewModel.isLiked ? .red : .white)
                        .padding(.bottom, 30)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}
