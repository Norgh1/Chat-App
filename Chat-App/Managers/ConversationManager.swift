//
//  ConversationManager.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore


final class ConversationManager {
  
  //MARK: Private properties
  static let shared = ConversationManager()
  
  //MARK: Private properties
  private let service = FirestoreService()
  
  private init() {}
  
}

//MARK: Public Methods Conversations
extension ConversationManager {
  func observeConversations(_ completion: @escaping (NetworkStatus<[ObjectConversation]>) -> Void) {
    service.observe(type: ObjectConversation.self, path: .conversations) { response in
      switch response {
        case.success(let conversations):
          guard let userId = Usermanager.shared.currentUser?.id else { return }
          let filteredConversations = conversations?.filter({$0.participantIds.contains(userId)})
          completion(.success(filteredConversations))
        case .noConnection:
          completion(.noConnection)
        case.generalError:
          completion(.generalError)
      }
    }
  }
  
  func fetchConversations(_ completion: @escaping (NetworkStatus<[ObjectConversation]>) -> Void) {
    service.read(type: ObjectConversation.self, path: .conversations) { response in
      switch response {
        case.success(let conversations):
          guard let userId = Usermanager.shared.currentUser?.id else { return }
          let filteredConversations = conversations?.filter({$0.participantIds.contains(userId)})
          completion(.success(filteredConversations))
        case .noConnection:
          completion(.noConnection)
        case.generalError:
          completion(.generalError)
      }
    }
  }
  
  func createConversation(participantId: String, _ completion: @escaping (NetworkStatus<ObjectConversation>) -> Void) {
    guard let userId = Usermanager.shared.currentUser?.id else {
      completion(.generalError)
      return
    }
    let conversation = ObjectConversation()
    conversation.participantIds = [userId, participantId]
    service.set(conversation, path: .conversations) { response in
      switch response {
        case .success:
          completion(.success(conversation))
        case .noConnection:
          completion(.noConnection)
        case .generalError:
          completion(.generalError)
      }
    }
  }
}

//MARK: Public methods messages
extension ConversationManager {
  func observeMessages(conversationId: String, _ completion: @escaping (NetworkStatus<[ObjectMessage]>) -> Void) {
    service.observe(type: ObjectMessage.self, path: .conversations, documentId: conversationId, secondPath: .messeges) { response in
      switch response {
        case .success(let messages):
          completion(.success(messages))
        case .noConnection:
          completion(.noConnection)
        case .generalError:
          completion(.generalError)
      }
    }
  }
  
  func send(_ message: ObjectMessage, conversationId: String, _ completion: @escaping (NetworkStatus<Void>) -> Void) {
    service.set(message, documentId: conversationId, path: .conversations, secondPath: .messeges)  { response in
      switch response {
        case .success:
          completion(.success(()))
        case .noConnection:
          completion(.noConnection)
        case .generalError:
          completion(.generalError)
      }
    }
  }
}
