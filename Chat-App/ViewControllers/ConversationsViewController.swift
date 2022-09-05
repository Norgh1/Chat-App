//
//  ConversationsViewController.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import UIKit

final class ConversationsViewController: UIViewController {
  
  //MARK: Outlets
  @IBOutlet weak var collectionView: UICollectionView!
  
  //MARK: Private properties
  private var users = [ObjectUser]()
  private var conversations = [ObjectConversation]()
  private var state: State = .inital {
    didSet { collectionView.reloadData() }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    state = .inital
    observeUsers()
    observeConversations()
  }
}

//MARK: IBActions
private extension ConversationsViewController {
  @IBAction func editProfileSelected(_ sender: Any) {
    Coordinator.showEditProfile(from: self)
  }
  
  @IBAction func newConversationPressed(_ sender: Any) {
    Coordinator.showCompose(from: self)
  }
}

//MARK: Private methods
private extension ConversationsViewController {
  func observeUsers() {
    Usermanager.shared.observeAllUsers {[weak self] result in
      switch result {
        case .generalError, .noConnection:
          self?.state = .networkError
        case .success(let users):
          self?.users = users ?? []
          self?.state = .normal
      }
    }
  }
  
  func observeConversations() {
    ConversationManager.shared.observeConversations {[weak self] result in
      switch result {
        case .generalError, .noConnection:
          self?.state = .networkError
        case .success(let conversations):
          self?.conversations = conversations ?? []
          self?.state = .normal
      }
    }
  }
}

//MARK: CollectionView methods
extension ConversationsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch state {
      case .inital, .networkError, .noItems:
        return 1
      case .normal:
        return conversations.count + 1
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch state {
      case .inital, .networkError, .noItems:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaceholderCell.className, for: indexPath) as! PlaceholderCell
        return cell.configure(state)
      case .normal:
        guard indexPath.row != 0 else {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UsersCell.className, for: indexPath) as! UsersCell
          return cell.configure(users)
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConversationCell.className, for: indexPath) as! ConversationCell
      return cell.configure(conversations[indexPath.row - 1])
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard state == .normal, indexPath.row != 0 else { return }
    let conversation = conversations[indexPath.row - 1]
    Coordinator.showMessages(conversation: conversation, from: self)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    switch state {
      case .networkError, .inital, .noItems:
        return collectionView.bounds.size
      case .normal:
        return CGSize(width: collectionView.bounds.width, height: 90)
    }
  }
}

//MARK: usercompose delegate
extension ConversationsViewController: UserComposeViewControllerDelegate {
  func show(conversationId: String) {
    guard let conversation = conversations.filter({$0.id == conversationId}).first else { return }
    Coordinator.showMessages(conversation: conversation, from: self)
  }
  
  func newConversation(userId: String) {
    ConversationManager.shared.createConversation(participantId: userId) { response in
      switch response {
        case .success(let conversation):
          guard let conversation = conversation else { return }
          Coordinator.showMessages(conversation: conversation, from: self)
        default: break
      }
    }
  }
}
