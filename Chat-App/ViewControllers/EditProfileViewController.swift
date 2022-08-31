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
  
  //MARK: private properties
  private var users = ObjectUser()
  
  //MARK: IBAction logout
    @IBAction func logoutPressed() {
      Usermanager.shared.logout { response in
        guard case .success = response else { return }
        Coordinator.showOnboarding()
      }
    }
  
  @IBAction func imagePressed() {
    setupPicker()
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
//MARK: UIImagePicker Delegate
extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
      Usermanager.shared.editProfile(user: users.self) { response in
        switch response {
        case .success(_):
          self.imageView.image = image
        case.noConnection, .generalError:
          break
        }
      }
    }
    dismiss(animated: true)
  }
}

//MARK: Edite photo picker
private extension EditProfileViewController {
  private func setupPicker(){
    let picker = UIImagePickerController()
    picker.sourceType = .photoLibrary
    picker.delegate = self
    picker.allowsEditing = true
    present(picker, animated: true)
  }
}
