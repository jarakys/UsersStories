//
//  NetworkError.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import Foundation

enum NetworkError: LocalizedError {
    case unknown(error: Error)
    
    var errorDescription: String? {
        switch self {
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
