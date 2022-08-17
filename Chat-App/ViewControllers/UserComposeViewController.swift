//
//  UserComposeViewController.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/17/22.
//

import UIKit

final class UserComposeViewController: UIViewController {
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    Usermanager.shared.fetchAllUsers { response in
      //users
      ConversationManager.shared.fetchConversations { response in
        //check if selected user already has a conversation
        //if so show messages viewconroller
        //otherwise create conversation and then show the messages viewconroller
      }
    }
  }
  
}
