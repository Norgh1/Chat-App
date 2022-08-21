//
//  MessagesViewController.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/17/22.
//

import UIKit

protocol MessagesViewControllerDelegate: UIViewController {
  func show(_ conversationID: String)
  func create(_ userID: String)
}

final class MessagesViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var textField: UITextField!


  //MARK: private properties
  private var conversations = [ObjectMessage]()
  private var users = [ObjectUser]()
  
  //MARK: Delegate
  weak var delegate: MessagesViewControllerDelegate?
  
  
  var conversationId = ""
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    observeMessages()
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
//MARK: functions
extension MessagesViewController {
    func observeMessages(){
    ConversationManager.shared.observeMessages(conversationId: conversationId) {[weak self] response in
      switch response {
        case.success(let message):
          self?.conversations = message ?? []
        print(message!.count)
        self?.collectionView.reloadData()
        case.generalError, .noConnection:
          print("Here is break!")
          break
      }
    }
  }
}

//MARK: Collectionview methods
extension MessagesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return conversations.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserSingleCell.className, for: indexPath) as! UserSingleCell
    return cell.configure(users[indexPath.row])
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let user = conversations[indexPath.row]
    if let convers = conversations.filter({$0.recipientId.contains(user.id)}).first {
      delegate?.show(convers.id)
      print(1234567)
      return
    }
    delegate?.create(user.id)
    print(12345678)
    dismiss(animated: true)
  }
 
}
//MARK: TextFiled methods
extension MessagesViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.becomeFirstResponder()
    self.view.endEditing(true)
    return true
  }
  func textFieldShouldClear(_ textField: UITextField) -> Bool {
    return true
  }
}
