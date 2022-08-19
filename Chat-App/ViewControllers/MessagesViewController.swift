//
//  MessagesViewController.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/17/22.
//

import UIKit

final class MessagesViewController: UIViewController {
  //MARK: private properties
  private var message = ObjectMessage()
  private var servise = FirestoreService()
  
   var conversationId = ""
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    ConversationManager.shared.observeMessages(conversationId: conversationId) { response in
      switch response {
      case.success(let message):
        guard let messageCount = message?.count else { return }
        print("Coun\(messageCount)")
      case.generalError, .noConnection:
        print("Here is break!")
        break
      }
    }
  }
  
  func send(message: String) {
    ConversationManager.shared.send(ObjectMessage(), conversationId: conversationId) { response in
      
    }
  }
  
}
