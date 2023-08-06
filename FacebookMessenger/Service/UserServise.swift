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
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
    }
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
    
    static func fetchuser(withUid uid: String, completion: @escaping(User) -> Void) {
        FirestoreConstants.userCollection.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            completion(user)
        }
    }
}
