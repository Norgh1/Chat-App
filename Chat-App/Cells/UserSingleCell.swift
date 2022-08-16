//
//  UserSingleCell.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/16/22.
//

import UIKit

final class UserSingleCell: UICollectionViewCell {
  
  @IBOutlet weak var userView: UserView!
  @IBOutlet weak var userNameLabel: UILabel!
  
  func configure(_ user: ObjectUser) -> UserSingleCell {
    userView.user = user
    userNameLabel.text = user.name
    return self
  }
}
