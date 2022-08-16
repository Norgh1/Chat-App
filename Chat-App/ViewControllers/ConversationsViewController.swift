//
//  ConversationsViewController.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import UIKit

final class ConversationsViewController: UIViewController {

  let userModel : [UserModel] = [
    UserModel(name: "first", image: UIImage(named: "emoji1")!),
    UserModel(name: "first", image: UIImage(named: "emoji2")!),
    UserModel(name: "first", image: UIImage(named: "emoji3")!),
    UserModel(name: "first", image: UIImage(named: "emoji4")!),
    UserModel(name: "first", image: UIImage(named: "emoji1")!),
    UserModel(name: "first", image: UIImage(named: "emoji2")!),
    UserModel(name: "first", image: UIImage(named: "emoji3")!),
    UserModel(name: "first", image: UIImage(named: "emoji4")!)
  ]
  
  @IBOutlet weak var collectionViewTop: UICollectionView!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    configureCollectionViewTop()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }

  @IBAction func logoutPressed(_ sender: Any) {
    Usermanager.shared.logout { _ in
      Coordinator.showOnboarding()
    }
  }
}

extension ConversationsViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    userModel.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConversationCell.id, for: indexPath) as! ConversationCell
    cell.configure(with: userModel[indexPath.row])
    return cell
  }
}

private extension ConversationsViewController {
  func configureCollectionViewTop() {
    collectionViewTop.dataSource = self
    collectionViewTop.delegate = self
    collectionViewTop.register(ConversationCell.self, forCellWithReuseIdentifier: ConversationCell.id)
    collectionViewTop.showsHorizontalScrollIndicator = false
    collectionViewTop.layoutMargins = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
  }
}
