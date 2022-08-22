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
  private var objConversations = [ObjectConversation]()
  private var users = [ObjectUser]()
  private var state: Mode = .inital {
    didSet { collectionView.reloadData() }
  }
  
  //MARK: Delegate
  weak var delegate: MessagesViewControllerDelegate?
  
  
  var conversationId = ""
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    state = .normal
    observeMessagess()
    observeMessages()
    featchAllMessages()
  }
  
  
  
  
  @IBAction func sendPressed() {
    guard let messageText = textField.text else { return }
    let message = ObjectMessage()
    message.recipientIds = Usermanager.shared.currentUser?.id ?? ""
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
  func featchAllMessages() {
    ConversationManager.shared.fetchConversations { [weak self] respone in
      switch respone {
      case.success(let conversations):
        self?.objConversations = conversations ?? []
        print("print me me me me")
      case.noConnection:
        self?.showAlert(title: "Attenation...!", message: "No Connection!")
      case.generalError:
        self?.showAlert(title: "Attenation...!", message: "Somthing Wrong!")
      }
    }
  }
  func observeMessagess() {
    ConversationManager.shared.observeMessages(conversationId: conversationId) { [weak self] response in
      switch response {
      case.success(let mess):
        self?.conversations = mess ?? []
        print("convvvvv created")
        self?.collectionView.reloadData()
      case.generalError, .noConnection:
        break
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
        return conversations.count + 1
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch state {
    case .inital, .networkError, .noItems:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaceholderCell.className, for: indexPath) as! PlaceholderCell
      return cell.configure(.inital)
    case.normal:
      guard indexPath.row != 0 else {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UsersCell.className, for: indexPath) as! UsersCell
        return cell.configure(users)
      }
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConversationCell.className, for: indexPath) as! ConversationCell
      return cell.configure(objConversations[indexPath.row - 1])
    }
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    switch state {
      case .networkError, .inital, .noItems:
        return collectionView.bounds.size
      case .normal:
        return CGSize(width: collectionView.bounds.width, height: 80)
  }
}
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let user = conversations[indexPath.row]
    if let convers = conversations.filter({$0.recipientIds.contains(user.id)}).first {
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
    self.view.endEditing(true)
    return true
  }
  func textFieldShouldClear(_ textField: UITextField) -> Bool {
    return true
  }
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    return true
  }
}


extension MessagesViewController {
  enum Mode {
    case inital
    case noItems
    case normal
    case networkError
  }
}
