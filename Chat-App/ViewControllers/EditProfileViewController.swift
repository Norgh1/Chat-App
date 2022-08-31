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
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  
  let service = ImagePickerService()
  
  //MARK: private properties
  private var selectedImage: UIImage?
  
  //MARK: IBAction logout
  @IBAction func logoutPressed() {
    Usermanager.shared.logout { response in
      guard case .success = response else { return }
      Coordinator.showOnboarding()
    }
  }
  
  @IBAction func imagePressed() {
    service.show(sourceType: .photoLibrary, from: self) {[weak self] image in
      self?.selectedImage = image
      self?.imageView.image = image
    }
  }
  
  @IBAction func savePressed() {
    let user = ObjectUser()
    user.id = Usermanager.shared.currentUser?.id ?? ""
    user.image = selectedImage
    user.name = nameTextField.text
    user.lastName = lastNameTextField.text
    Usermanager.shared.editProfile(user: user) { response in
      //TODO
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUserdata()
  }
}

//MARK: User image
private extension EditProfileViewController {
  private func setUserdata() {
    nameTextField.text = Usermanager.shared.currentUser?.name
    lastNameTextField.text = Usermanager.shared.currentUser?.lastName
    imageView.kf.setImage(with: URL(string: Usermanager.shared.currentUser?.profileImageURL ?? ""))
  }
}
