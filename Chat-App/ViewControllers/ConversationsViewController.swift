//
//  ConversationsViewController.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import UIKit

final class ConversationsViewController: UIViewController{
  
    @IBOutlet weak var collectionView: UICollectionView!
    
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
      collectionView.backgroundColor = .systemGray5
      navigationItem.title = "xChat"
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }
  
  
  @IBAction func logoutPressed(_ sender: Any) {
    Usermanager.shared.logout { status in
      guard case .success = status else {
        return
      }
      Coordinator.showOnboarding()
    }
  }

}

extension ConversationsViewController : UICollectionViewDelegate, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let collView = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)
    collectionView.backgroundColor = .systemGray5
    return collView
  }
    
    
    
}







