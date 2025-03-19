//
//  BaseViewModel.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import Foundation

public class BaseViewModel {
    @Published var screenState: ScreenState = .loading
    @Published var error: LocalizedError?
    
    @MainActor
    public func handleError(error: any Error) {
        switch error {
        case let error as NetworkError:
            self.error = error
            print("Network error: \(error)")
        default:
            self.error = NetworkError.unknown(error: error)
            print("Unknown error: \(error)")
        }
        screenState = .loaded
    }
}
