//
//  StoryModel.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import Foundation

public struct StoryModel: Codable, Identifiable {
    public let id: Int
    public let url: String
}
