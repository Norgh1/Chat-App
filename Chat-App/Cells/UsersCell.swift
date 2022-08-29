//
//  UsersCell.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/16/22.
//

import UIKit

protocol UsersCellDelegate: UIViewController {
  func didSelect(_ user: ObjectUser)
}

final class UsersCell: UICollectionViewCell {
  
  //MARK: Private properties
  @IBOutlet weak private var collectionView: UICollectionView!
  private var users = [ObjectUser]()
  
  //MARK: Public properties
  weak var delegate: UsersCellDelegate?
  
  override func layoutSubviews() {
    super.layoutSubviews()
    collectionView.frame = contentView.bounds
  }
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
extension UsersCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return users.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserSingleCell.className, for: indexPath) as! UserSingleCell
    return cell.configure(users[indexPath.row])
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    delegate?.didSelect(users[indexPath.row])
  }
}
