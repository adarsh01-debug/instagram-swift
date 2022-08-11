//
//  PostModel.swift
//  Instagram
//
//  Created by Adarsh Pandey on 10/08/22.
//

import Foundation

struct PostModel: Codable {
    let id, userID: String?
    let name: String?
    let postURL, caption, hashtag, date: String?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "userId"
        case name
        case postURL = "postUrl"
        case caption, hashtag, date
    }
}
