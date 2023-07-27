//
//  UserServise.swift
//  FacebookMessenger
//
//  Created by Nick Pavlov on 7/17/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class UserServise {
    @Published var currentUser: User?
    
    static let shared = UserServise()
    
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
    }
}