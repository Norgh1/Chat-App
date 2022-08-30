//
//  UserComposeCell.swift
//  Chat-App
//
//  Created by Nor Gh on 24.08.22.
//

import UIKit

final class UserComposeCell: UICollectionViewCell {
  
  //MARK: Outlets
  @IBOutlet weak var userView: UserView!
  @IBOutlet weak var nameLabel: UILabel!
  
  func configure(_ user: ObjectUser) -> UserComposeCell {
    nameLabel.text = user.fullName
    userView.user = user
    return self
  }
}
