//
//  UserComposeCell.swift
//  Chat-App
//
//  Created by Nor Gh on 24.08.22.
//

import UIKit

final class UserComposeCell: UICollectionViewCell {
  
  //MARK: Private properties
  private var user = ObjectUser()
  
  //MARK: Outlets
  @IBOutlet weak var userView: UserView!
  @IBOutlet weak var userNameLabel: UILabel!
  @IBOutlet weak var lastMessage: UILabel!
  
    
  func configure(_ conversation: ObjectConversation) -> UserComposeCell {
    userNameLabel.text = conversation.id
    lastMessage.text = conversation.lastMessage
    userView.user = user
    return self
  }
}
