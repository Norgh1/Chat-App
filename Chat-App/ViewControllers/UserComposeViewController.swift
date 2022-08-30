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
  private var state: State = .inital {
    didSet { collectionView.reloadData() }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 120, right: 0)
    state = .normal
    fetchUsers()
    fetchConversations()
  }
    
    @IBAction func closePressed() {
        dismiss(animated: true)
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

extension UserComposeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return users.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch state {
    case.inital, .noItems, .networkError:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaceholderCell.className, for: indexPath) as! PlaceholderCell
      return cell.configure(state)
    case.normal:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserComposeCell.className, for: indexPath) as! UserComposeCell
      return cell.configure(users[indexPath.row])
      }
    }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.bounds.width / 4
    return CGSize(width: width, height: width + 30)
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
