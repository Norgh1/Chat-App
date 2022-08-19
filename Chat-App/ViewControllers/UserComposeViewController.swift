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
  //private var conversation = [ObjectConversation]()
  private var servise = FirestoreService()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //MARK: Current Users
    Usermanager.shared.fetchAllUsers { reponse  in
      self.servise.read(type: ObjectUser.self, path: .users) { response in
        switch response {
        case.generalError, .noConnection:
          break
        case.success(let currentUser):
          guard let allUsers = currentUser?.filter({$0.id != self.user.id }) else { return }
          print("User Count is \(allUsers.count)")
        }
      }
    }
    //MARK: Conversations
      ConversationManager.shared.fetchConversations { response in
        self.servise.read(type: ObjectConversation.self, path: .conversations) { response in
          switch response {
          case.noConnection, .generalError:
            print("No Conversation?!")
            break
          case.success(let conversation):
            print("conversation count \(conversation!.count)")
          }
        }
      }
    
        //check if selected user already has a conversation
        //if so show messages viewconroller
        //otherwise create conversation and then show the messages viewconroller
      }
    }
