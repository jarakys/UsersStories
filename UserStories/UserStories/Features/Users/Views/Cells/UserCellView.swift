//
//  UserCellView.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import SwiftUI

struct UserCellView: View {
    let user: UserModel
    
    var body: some View {
        HStack(spacing: 10) {
            //It's better to use KFImage instead of AsyncImage, because it has more features and better performance & cache
            CircleUserView(url: user.profilePictureUrl)
            Text(user.name)
        }
    }
}
