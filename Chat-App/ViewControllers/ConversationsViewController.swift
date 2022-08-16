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
  private var state: Mode = .inital {
    didSet { updateUI() }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    state = .inital
    observeUsers()
    observeConversations()
  }
}

//MARK: Private methods
private extension ConversationsViewController {
  func observeUsers() {
    
  }
  
  func observeConversations() {
    
  }
  
  func updateUI() {
    
  }
}

//MARK: CollectionView methods
extension ConversationsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
        //TODO configure cell
        return cell
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
    //TODO
    let conversation = conversations[indexPath.row - 1]
  }
}


//MARK: Models
private extension ConversationsViewController {
  enum Mode {
    case inital
    case noItems
    case normal
    case networkError
  }
}
