//
//  AuthService.swift
//  FacebookMessenger
//
//  Created by Nick Pavlov on 7/16/23.
//

import Foundation
import Firebase

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(with email: String, password: String) async throws {
        //try await Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func createUser(with email: String, password: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: created user \(result.user.uid))")
        } catch {
            print("DEBUG: Faidel to create user \(error.localizedDescription)")
        }
    }
}
