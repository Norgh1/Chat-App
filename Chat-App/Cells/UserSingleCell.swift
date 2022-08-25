//
//  UserSingleCell.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/16/22.
//

import UIKit

final class UserSingleCell: UICollectionViewCell {
  //MARK: Outlets
  @IBOutlet weak var userView: UserView!
  @IBOutlet weak var userNameLabel: UILabel!
  
  //MARK: private proparties
  private var collectionView: UICollectionView!
  
  override func layoutSubviews() {
    super.layoutSubviews()
      userView.frame = contentView.bounds
  }
  
  func configure(_ user: ObjectUser) -> UserSingleCell {
    configureUI()
    userView.user = user
    userNameLabel.text = user.name
    return self
  }
}

extension UserSingleCell {
  private func configureUI(){
    
    
    userNameLabel.font = .boldSystemFont(ofSize: 15)
    userView.translatesAutoresizingMaskIntoConstraints = false
    userView.clipsToBounds = true
    userView.backgroundColor = .systemGray6
  }
}
