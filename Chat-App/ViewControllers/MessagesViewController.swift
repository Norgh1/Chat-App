//
//  MessagesViewController.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/17/22.
//

import UIKit

final class MessagesViewController: UIViewController {
  
  //MARK: Outlets
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var textField: UITextField!
  
  //MARK: Public properties
  var conversationId = ""

  //MARK: private properties
  private var messages = [ObjectMessage]()
  private var state: Mode = .inital {
    didSet { collectionView.reloadData() }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    state = .normal
    observeMessages()
    setupKeyboardHiding()
  }
}

//MARK: Private methods
private extension MessagesViewController {
  func observeMessages(){
    ConversationManager.shared.observeMessages(conversationId: conversationId) {[weak self] response in
      switch response {
        case.success(let messages):
          self?.messages = messages ?? []
          self?.collectionView.reloadData()
        case .generalError:
          self?.showAlert(title: "Attenation...!", message: "General Error")
        case.noConnection:
          self?.showAlert(title: "Attenation...!", message: "No Connection!")
      }
    }
  }
  
  @IBAction func sendPressed() {
    guard let messageText = textField.text else { return }
    let message = ObjectMessage()
    message.recipientIds = ""//Usermanager.shared.currentUser?.id ?? ""
    message.messageType = .text
    message.content = messageText
    ConversationManager.shared.send(message, conversationId: conversationId) { response in
      switch response {
        case .success:
          self.textField.text = ""
        case .generalError:
          self.showAlert(title: "Attenation...!", message: "General Error")
        case.noConnection:
          self.showAlert(title: "Attenation...!", message: "No Connection!")
      }
    }
  }
}

//MARK: Collectionview methods
extension MessagesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch state {
      case .inital, .networkError, .noItems:
        return 1
      case .normal:
        return messages.count
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch state {
      case .inital, .networkError, .noItems:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaceholderCell.className, for: indexPath) as! PlaceholderCell
        return cell.configure(.inital)
      case.normal:
        let message = messages[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: (message.recipientIds == Usermanager.shared.currentUser?.id ?? "") ? "owner" : "sender", for: indexPath) as! MessageCell
        return cell.configure(message)
    }
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

//MARK: TextFiled methods
extension MessagesViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    return textField.resignFirstResponder()
  }
}
//MARK: TextFiled_show_hide
extension MessagesViewController {
  private func setupKeyboardHiding() {
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(kayboardWillShow),
                                           name: UIResponder.keyboardWillShowNotification,
                                           object: nil)
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(keyboardWillHide),
                                           name: UIResponder.keyboardWillHideNotification,
                                           object: nil)
  }
  @objc func kayboardWillShow() {
    view.frame.origin.y = view.frame.origin.y - 175
  }
  @objc func keyboardWillHide(){
    view.frame.origin.y = 0
  }
}
//MARK: Models
extension MessagesViewController {
  enum Mode {
    case inital
    case noItems
    case normal
    case networkError
  }
}

