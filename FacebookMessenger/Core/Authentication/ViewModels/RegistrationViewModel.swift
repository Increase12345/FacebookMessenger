//
//  RegistrationViewModel.swift
//  FacebookMessenger
//
//  Created by Nick Pavlov on 7/16/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    
    func createUser() async throws {
        try await AuthService().createUser(with: email, password: password, fullName: fullName)
    }
}
