//
//  ConversationManager.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import Foundation

final class ConversationManager {
  
  static var shared = ConversationManager()
  
  private init() {}
  
}

//MARK: Conversations
extension ConversationManager {
  
  func observeConversations(_ completion: @escaping (NetworkStatus<[ObjectConversation]>) -> Void) {
    
  }
  
  func observeMessages(conversationId: String, _ completion: @escaping (NetworkStatus<[ObjectMessage]>) -> Void) {
    
  }
  
  func send(_ message: ObjectMessage, _ completion: @escaping (NetworkStatus<Void>) -> Void) {
    
  }
}
