//
//  Protocols.swift
//  Instagram
//
//  Created by Adarsh Pandey on 08/08/22.
//

import Foundation

protocol Response {
    func sendUserInfo(user: UserModel)
    func sendStatus(status: Bool)
}

protocol CheckValidation: AnyObject {
    func sendToken(token:String)
    func sendStatus(status:Bool)
    func sendUser (user : UserModel)
}

protocol PostManagerDelegate: AnyObject {
    func updatedData(postData: [PostModel])
}

protocol StoryManagerDelegate: AnyObject {
    func updatedData(storyData: [StoryModel])
}

protocol UserIdDelegate: AnyObject {
    func getUserId(userId: String)
}

protocol CommentsDelegate: AnyObject {
    func openCommentSection()
}

protocol PostDetailDelegate: AnyObject {
    func toggleHeight(newHeight: Double)
}

protocol UserPostsDelegate: AnyObject {
    func getUserPosts(posts: [PostModel])
}

protocol AdsManagerDelegate: AnyObject {
    func getAds(adData: AdModel)
}
