//
//  UserComposeCell.swift
//  Chat-App
//
//  Created by Nor Gh on 20.08.22.
//

import UIKit

class UserComposeCell: UICollectionViewCell {
    
  @IBOutlet weak var view: UserView!
  @IBOutlet weak var userNameLabel: UILabel!
  
  func configure(_ user: ObjectUser) -> UserComposeCell {
    view.user = user
    userNameLabel.text = user.name
    return self
  }
  
}
