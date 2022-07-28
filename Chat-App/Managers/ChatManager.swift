//
//  ChatManager.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import Foundation

final class ChatManager {
    
    static var shared = ChatManager()

    private init() {}
    
}

//MARK: Authentication
extension ChatManager {
    
    func isSignedIn() -> Bool {
        return false
    }
    
    func signUp() {
        
    }
    
    func signIn() {
        
    }
}

//MARK: Conversations
extension ChatManager {
    
    func observeConversations() {
        
    }
    
    func observeSingleConversation() {
        
    }
    
    func sendMessage() {
        
    }
}

//MARK: Users
extension ChatManager {
    func fetchAllUsers() {
        
    }
}
