//
//  User.swift
//  FacebookMessenger
//
//  Created by Nick Pavlov on 7/2/23.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable, Identifiable, Hashable {
    @DocumentID var uid: String?
    let fullName: String
    let email: String
    var profileImageUrl: String?
    
    var id: String {
        uid ?? NSUUID().uuidString
    }
}

extension User {
    static let MOCK_USER = User(fullName: "Nick Pavlov", email: "increase@gmail.com", profileImageUrl: "image")
}
