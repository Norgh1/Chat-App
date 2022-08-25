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
  
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  func configure(_ conversation: ObjectConversation) -> UserComposeCell {
    configureUI()
    userNameLabel.text = conversation.id
    lastMessage.text = conversation.lastMessage
    userView.user = user
    return self
  }
}
extension UserComposeCell {
private func configureUI(){
  userView.clipsToBounds = true
  userView.contentMode = .scaleAspectFill
  userView.layer.masksToBounds = true
  userView.backgroundColor = .red
  }
}
