//
//  UserModel.swift
//  Instagram
//
//  Created by Adarsh Pandey on 09/08/22.
//

import Foundation

struct UserModel: Codable {
    let id, name, email, password: String?
    let phoneNo, gender, accountType, dob: String?
    let socialMediaId: Int?
    let interest: [String]?
}

struct UserId: Codable {
    let id, name, email, password: String
    let mobileNumber, gender, accountType: String
    let interests: [String]
}
