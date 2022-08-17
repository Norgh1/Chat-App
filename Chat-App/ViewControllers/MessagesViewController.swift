//
//  MessagesViewController.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/17/22.
//

import UIKit

final class MessagesViewController: UIViewController {
  
  
  var conversationId = ""
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    ConversationManager.shared.observeMessages(conversationId: conversationId) { response in
      
    }
  }
  
  func send(message: String) {
    ConversationManager.shared.send(ObjectMessage(), conversationId: conversationId) { response in
      
    }
  }
  
}
