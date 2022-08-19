//
//  MessagesViewController.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/17/22.
//

import UIKit

final class MessagesViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var textField: UITextField!
  
  //MARK: private properties
  private var messages = [ObjectMessage]()
  
  var conversationId = ""
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    ConversationManager.shared.observeMessages(conversationId: conversationId) {[weak self] response in
      switch response {
        case.success(let message):
          self?.messages = message ?? []
          self?.collectionView.reloadData()
        case.generalError, .noConnection:
          print("Here is break!")
          break
      }
    }
  }
  
  @IBAction func sendPressed() {
    guard let messageText = textField.text else { return }
    let message = ObjectMessage()
    message.recipientId = Usermanager.shared.currentUser?.id ?? ""
    message.messageType = .text
    message.content = messageText
    ConversationManager.shared.send(message, conversationId: conversationId) { response in
      switch response {
        case .success:
          self.textField.text = ""
        case .generalError, .noConnection:
          print(1233)
      }
    }
  }
  
}

//MARK: Collectionview methods
extension MessagesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return messages.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return UICollectionViewCell()
  }
}
