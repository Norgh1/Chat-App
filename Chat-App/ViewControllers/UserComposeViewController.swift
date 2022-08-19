//
//  UserComposeViewController.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/17/22.
//

import UIKit
import FirebaseFirestore


final class UserComposeViewController: UIViewController {
  
  //MARK: Private properties
  private var user = ObjectUser()
  private var conversation = [ObjectConversation]()
  private var servise = FirestoreService()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    Usermanager.shared.fetchAllUsers { reponse  in
      self.servise.read(type: ObjectUser.self, path: .conversations) { response in
        switch response {
        case.generalError, .noConnection:
          break
        case.success(let currentUser):
          guard let allUsers = currentUser?.filter({$0.id != self.user.id }) else { return }
          print("Print meee! \(allUsers.count)")
        }
      }
    }
      ConversationManager.shared.fetchConversations { response in
        }
        //check if selected user already has a conversation
        //if so show messages viewconroller
        //otherwise create conversation and then show the messages viewconroller
      }
    }
