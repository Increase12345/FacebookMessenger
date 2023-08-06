//
//  Message.swift
//  FacebookMessenger
//
//  Created by Nick Pavlov on 7/28/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Message: Codable, Identifiable, Hashable {
    @DocumentID var messageId: String?
    let fromId: String
    let toId: String
    let messageText: String
    let timestamp: Timestamp
    
    var user: User?
    
    var id: String {
        messageId ?? NSUUID().uuidString
    }
    
    var chatPartnerId: String {
        fromId == Auth.auth().currentUser?.uid ? toId: fromId
    }
    
    var isFromCurrentUser: Bool {
        fromId == Auth.auth().currentUser?.uid
    }
    
    var timestampString: String {
        timestamp.dateValue().timestampString()
    }
}
