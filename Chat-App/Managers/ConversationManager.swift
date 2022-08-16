//
//  ConversationManager.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore
import FirebaseAuth


final class ConversationManager {



  //MARK: Private proparties
  
  static let shared = ConversationManager()
  private let objectUser = ObjectUser()
  
  
  @UserDefaultsService(.isFirstLaunch) var conversations: ObjectConversation?
  
  private let service = FirestoreService()
  
  private init() {}
  
}

//MARK: Conversations
  
extension ConversationManager {
  
  func observeConversations(_ completion: @escaping (NetworkStatus<[ObjectConversation]>) -> Void) {
    service.observe(type: ObjectConversation.self, path: .conversations) { snapshot in
      
    }
  }
  
  func observeMessages(conversationId: String, _ completion: @escaping (NetworkStatus<[ObjectMessage]>) -> Void) {
//    service.observe(type: [ObjectMessage].self, path: .messeges) { conversationID  in
//      guard let messeges = try? conversationId else { return }
//      print(messeges)
  }
  
  func send(_ message: ObjectMessage, _ completion: @escaping (NetworkStatus<Void>) -> Void) {
    service.set(objectUser, path: .messeges) { snapshot in
      print(snapshot)
    }
  }
}



