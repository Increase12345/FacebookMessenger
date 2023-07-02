//
//  SettingsOptionsViewModel.swift
//  FacebookMessenger
//
//  Created by Nick Pavlov on 7/2/23.
//

import Foundation
import SwiftUI

enum SettingsOptionsViewModel: Int, CaseIterable, Identifiable {
    case darkMode, activeStatus, accessibility, privacy, notifications
    
    var id: Int {
        self.rawValue
    }
    
    var title: String {
        switch self {
        case .darkMode:
            return "Dark mode"
        case .activeStatus:
            return "Active status"
        case .accessibility:
            return "Accessibility"
        case .privacy:
            return "Privacy and safety"
        case .notifications:
            return "Notifications"
        }
    }
    
    var imageName: String {
        switch self {
        case .darkMode:
            return "moon.circle.fill"
        case .activeStatus:
            return "message.badge.circle.fill"
        case .accessibility:
            return "person.circle.fill"
        case .privacy:
            return "lock.circle.fill"
        case .notifications:
            return "bell.circle.fill"
        }
    }
    
    var imageBackgroundColor: Color {
        switch self {
        case .darkMode:
            return .primary
        case .activeStatus:
            return .green
        case .accessibility:
            return .primary
        case .privacy:
            return .blue
        case .notifications:
            return .purple
        }
    }
}
