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
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(with email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to signIn \(error.localizedDescription)")
        }
    }
    
    func createUser(with email: String, password: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Faidel to create user \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut() // signOut on backend
            self.userSession = nil // updates routing logic
        } catch {
            print("DEBUG: Failed to signOut \(error.localizedDescription)")
        }
    }
}
