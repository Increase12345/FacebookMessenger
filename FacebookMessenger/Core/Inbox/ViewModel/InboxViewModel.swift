//
//  InboxViewModel.swift
//  FacebookMessenger
//
//  Created by Nick Pavlov on 7/27/23.
//

import Foundation
import Combine
import Firebase

class InboxViewModel: ObservableObject {
    @Published var currentUser: User?
    
    private var cancellables = Set<AnyCancellable>()
    
    private func setupSubscribers() {
        UserServise.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
}
