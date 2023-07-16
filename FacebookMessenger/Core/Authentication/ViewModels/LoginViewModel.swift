//
//  LoginViewModel.swift
//  FacebookMessenger
//
//  Created by Nick Pavlov on 7/16/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try await AuthService().login(with: email, password: password)
    }
}
