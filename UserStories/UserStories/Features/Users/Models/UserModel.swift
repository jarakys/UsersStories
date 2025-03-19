//
//  UserModel.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import Foundation

public struct UserModel: Codable, Identifiable, Hashable {
    public let id: Int
    public let name: String
    public let profilePictureUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profilePictureUrl = "profile_picture_url"
    }
}
