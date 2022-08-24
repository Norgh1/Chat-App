//
//  EditProfileViewController.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/17/22.
//

import UIKit

final class EditProfileViewController: UIViewController {
  //MARK: IBAction
  @IBAction func buttonPressed() {
    Coordinator.showOnboarding()
  }
  private var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("Edit profile")
  }
  
}



extension EditProfileViewController {
  
}
