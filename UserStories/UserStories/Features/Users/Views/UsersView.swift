//
//  UsersView.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import SwiftUI

public struct UsersView: View {
    @StateObject var viewModel: UsersViewModel
    
    public var body: some View {
        List {
            ForEach(viewModel.users) { user in
                UserCellView(user: user)
                    .background(Color.white)
                    .onTapGesture {
                        viewModel.userClicked(user: user)
                    }
                    .onAppear {
                        if user == viewModel.users.last, viewModel.canLoadMore {
                            viewModel.pageLoading()
                        }
                    }
            }
            if viewModel.screenState == .pageLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}
