//
//  UserComposeViewController.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/17/22.
//

import UIKit

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
  private var state: Mode = .inital {
    didSet { collectionView.reloadData() }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    state = .normal
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
        case .generalError:
          self?.showAlert(title: "Attenation...!", message: "General Error")
      case.noConnection:
          self?.showAlert(title: "Attenation...!", message: "No Connection")
          
      }
    }
  }
  
  func fetchConversations() {
    ConversationManager.shared.fetchConversations {[weak self] response in
      switch response {
        case .success(let conversations):
          self?.conversations = conversations ?? []
          self?.collectionView.reloadData()
        case .generalError:
          self?.showAlert(title: "Attenation...!", message: "General Error")
        case.noConnection:
          self?.showAlert(title: "Attenation...!", message: "No Connection")
      }
    }
  }
}

extension UserComposeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return users.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch state {
    case.inital, .noItems, .networkError:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaceholderCell.className, for: indexPath) as! PlaceholderCell
      return cell.configure(.inital)
    case.normal:
      guard indexPath.row != 0 else {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UsersCell.className, for: indexPath) as! UsersCell
        return cell.configure(users)
      }
    }
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserComposeCell.className, for: indexPath) as! UserComposeCell
    return cell.configure(conversations[indexPath.row])
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.bounds.width, height: 90)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let user = users[indexPath.row]
    if let conversation = conversations.filter({$0.participantId.contains(user.id)}).first {
      delegate?.show(conversationId: conversation.id)
      dismiss(animated: true)
      return
    }
    delegate?.newConversation(userId: user.id)
    dismiss(animated: true)
  }
}
//MARK: Model
private extension UserComposeViewController{
  enum Mode {
    case inital
    case noItems
    case normal
    case networkError
  }
}
