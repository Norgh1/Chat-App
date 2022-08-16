//
//  UsersCell.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/16/22.
//

import UIKit

final class UsersCell: UICollectionViewCell {
  
  //MARK: Private properties
  @IBOutlet weak private var collectionView: UICollectionView!
  private var users = [ObjectUser]()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    collectionView.delegate = self
    collectionView.dataSource = self
  }
  
  func configure(_ users: [ObjectUser]) -> UsersCell {
    self.users = users
    collectionView.reloadData()
    return self
  }
}

//MARK: Collectionview methods
extension UsersCell: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return users.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserSingleCell.className, for: indexPath) as! UserSingleCell
    return cell.configure(users[indexPath.row])
  }
}
