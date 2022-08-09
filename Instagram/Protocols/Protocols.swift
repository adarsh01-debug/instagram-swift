//
//  Protocols.swift
//  Instagram
//
//  Created by Adarsh Pandey on 08/08/22.
//

import Foundation

protocol CommentsDelegate: AnyObject {
    func openCommentSection()
}

protocol PostDetailDelegate: AnyObject {
    func toggleHeight(newHeight: Double)
}
