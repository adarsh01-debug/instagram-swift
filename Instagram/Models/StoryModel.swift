//
//  StoryModel.swift
//  Instagram
//
//  Created by Adarsh Pandey on 11/08/22.
//

import Foundation

struct StoryModel: Codable {
    let id, userID: String?
    let url, name: String?
    let createdTime, expiryTime: String?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "userId"
        case url, createdTime, expiryTime, name
    }
}
