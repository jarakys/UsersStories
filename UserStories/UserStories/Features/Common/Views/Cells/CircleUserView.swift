//
//  CircleUserView.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import SwiftUI
import Kingfisher

struct CircleUserView: View {
    let url: String
    
    var body: some View {
        KFImage(URL(string: url))
            .placeholder({
                ProgressView()
            })
            .resizable()
            .setProcessors([ResizingImageProcessor(referenceSize: .init(width: 50, height: 50))])
            .backgroundDecode(true)
            .fromMemoryCacheOrRefresh()
            .diskCacheExpiration(.days(10))
            .scaledToFill()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
    }
}
