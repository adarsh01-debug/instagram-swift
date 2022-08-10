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

protocol CommentsDelegate: AnyObject {
    func openCommentSection()
}

protocol PostDetailDelegate: AnyObject {
    func toggleHeight(newHeight: Double)
}
