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
    service.observe(type: ObjectConversation.self, path: .conversations) { response in
      switch response {
      case.success(let users):
        let user = users?.filter({$0.id == (self.conversations?.id ?? "" )})
        print("printme")
        completion(.success(user))
      case .noConnection:
        completion(.noConnection)
      case.generalError:
        completion(.generalError)
      }
    }
  }
  
  func observeMessages(conversationId: String, _ completion: @escaping (NetworkStatus<[ObjectMessage]>) -> Void) {
    service.observe(type: ObjectMessage.self, path: .users) { response in
      switch response {
      case .success(let user):
        let users = user?.filter({$0.reciepeintId != (self.conversations?.id ?? "" )})
        print("print me tow")
        completion(.success(users))
      case .noConnection:
        completion(.noConnection)
      case .generalError:
        completion(.generalError)
      }
    }

  }
  
  func send(_ message: ObjectMessage, _ completion: @escaping (NetworkStatus<Void>) -> Void) {
//    service.read(type:ObjectMessage.self , path: .messeges) { response in
//      switch response {
//      case .success(let messege):
//        let userMessege = messege?.filter({$0.message == (self.conversations?.lastMessage ?? "")})
//        completion(.success(Void))
//      }
//    }
  }
}



