//
//  UserComposeViewController.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/17/22.
//

import UIKit
import FirebaseFirestore

protocol UserComposeViewControllerDelegate: UIViewController {
  func show(conversationId: String)
  func newConversation(userId: String)
}


final class UserComposeViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  weak var delegate: UserComposeViewControllerDelegate?
  
  //MARK: Private properties
  private var users = [ObjectUser]()
  private var conversations = [ObjectConversation]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchUsers()
    fetchConversations()
  }
  
  //MARK: Conversations
  func fetchUsers() {
    Usermanager.shared.fetchAllUsers {[weak self] response in
      switch response {
        case .success(let users):
          self?.users = users ?? []
          self?.collectionView.reloadData()
        default: break //TODO
      }
    }
  }
  
  func fetchConversations() {
    ConversationManager.shared.fetchConversations {[weak self] response in
      switch response {
        case .success(let conversations):
          self?.conversations = conversations ?? []
        case .noConnection:
          print(123)
        case .generalError:
          print(123)
      }
    }
  }
  
  //check if selected user already has a conversation
  //if so show messages viewconroller
  //otherwise create conversation and then show the messages viewconroller
}

extension UserComposeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return users.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return UICollectionViewCell()
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let user = users[indexPath.row]
    if let conversation = conversations.filter({$0.participantIds.contains(user.id)}).first {
      delegate?.show(conversationId: conversation.id)
      return
    }
    delegate?.newConversation(userId: user.id)
    dismiss(animated: true)
  }
}
