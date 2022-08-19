//
//  ConversationCell.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import UIKit

//MARK: Delegate
protocol ConversationCellDelegate: UIViewController {
  func didiSelect(_ conversation: ObjectConversation)
}

final class ConversationCell: UICollectionViewCell {
  
  //MARK: Private proparies
  private var user = ObjectUser()
  
  @IBOutlet weak var userView: UserView!
  @IBOutlet weak var userNameLabel: UILabel!
  @IBOutlet weak var lastMessage: UILabel!
  
    
  func configure(_ conversation: ObjectConversation) -> ConversationCell {
//    userNameLabel.text = conversation.id
//    lastMessage.text = conversation.lastMessage
//    userView.user = user
    return self
  }
 
}

