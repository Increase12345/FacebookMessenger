//
//  User.swift
//  FacebookMessenger
//
//  Created by Nick Pavlov on 7/2/23.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id = NSUUID().uuidString
    let fullName: String
    let email: String
    var profileImageUrl: String?
}

extension User {
    static let MOCK_USER = User(fullName: "Nick Pavlov", email: "increase@gmail.com", profileImageUrl: "image")
}
