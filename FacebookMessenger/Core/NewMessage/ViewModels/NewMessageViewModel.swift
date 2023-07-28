//
//  NewMessageViewModel.swift
//  FacebookMessenger
//
//  Created by Nick Pavlov on 7/27/23.
//

import Foundation
import Firebase

@MainActor
class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task {
            try await fetchUsers()
        }
    }
    
    func fetchUsers() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let users = try await UserServise.fetchAllUsers()
        self.users = users.filter({ $0.id != uid })
    }
}
