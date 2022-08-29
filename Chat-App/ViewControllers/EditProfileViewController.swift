//
//  EditProfileViewController.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/17/22.
//

import UIKit

final class EditProfileViewController: UIViewController {
  //MARK: IBOutlets
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var button: UIButton!
  
  //MARK: IBAction logout
  @IBAction func buttonPressed() {
    Coordinator.showOnboarding()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUserImage()
    configureButton()
  }
  
}

//MARK: User image
private extension EditProfileViewController {
  private func configureUserImage() {
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFit
    imageView.image = UIImage(named: Usermanager.shared.currentUser?.profileImageURL ?? "")
    let url = URL(string: "https://cultivatedculture.com/wp-content/uploads/2019/12/LinkedIn-Profile-Picture-Example-Rachel-Montan%CC%83ez.jpeg")
    imageView.kf.setImage(with: url)
  }
}

//MARK: LogOut button
private extension EditProfileViewController{
  private func configureButton() {
    button.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
  }
}
