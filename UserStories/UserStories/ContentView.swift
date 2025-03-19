//
//  ContentView.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        viewModel.userComponent.makeRoot()
    }
}

#Preview {
    ContentView()
}
