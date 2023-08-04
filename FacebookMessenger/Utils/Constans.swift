//
//  Constans.swift
//  FacebookMessenger
//
//  Created by Nick Pavlov on 8/3/23.
//

import Foundation
import Firebase

struct FirestoreConstants {
    static let userCollection = Firestore.firestore().collection("users")
    static let messagesCollection = Firestore.firestore().collection("messages")
}
