//
//  OnboardingViewController.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import UIKit

final class OnboardingViewController: UIViewController {
  
  //MARK: IBOutlets
  @IBOutlet var authView: UIView!
  @IBOutlet weak var segmentedView: SegmetedView!
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var authButton: MainButton!
  
  //MARK: LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    customization()
  }
  
  @IBAction func buttonPressed(_ sender: MainButton) {
    //TODO check the auth type: signin or signup
    guard let name = validateField(.name) else {
      //TODO show alert name is missing
      return
    }
    guard let lastName = validateField(.lastName) else {
      //TODO show alert lastName is missing
      return
    }
    guard let email = validateField(.email) else {
      //TODO show alert lastName is missing
      return
    }
    guard let password = validateField(.password) else {
      //TODO show alert lastName is missing
      return
    }
    sender.isAnimating = true
    Usermanager.shared.signup(name: name, lastName: lastName, email: email, password: password) {[weak self] response in
      self?.authButton.isAnimating = false
      switch response {
        case .success:
          print("ok")
          //TODO corrdinator show conversations
        case .generalError:
          //TODO alert
          print("someing worng")
        case .noConnection:
          //TODO alert
          print("sdgs")
      }
    }
  }
}

//MARK: IBActions
private extension OnboardingViewController {
  
  @IBAction func didSlide(_ sender: SliderView) {
    if sender.isSlided {
      authView.fadeIn()
    }
  }
  
  @IBAction func authDismissed() {
    authView.fadeOut()
  }
  
  @IBAction func segmentPressed(_ sender: SegmetedView) {
    updateUI()
  }
}

//MARK: Private methods
private extension OnboardingViewController {
  
  func customization() {
    //Emojies
    let rotatingValues = [CGFloat.pi - 4, CGFloat.pi - 3, CGFloat.pi - 3, CGFloat.pi - 3, CGFloat.pi - 3]
    rotatingValues.enumerated().forEach({view.viewWithTag($0.offset + 1)?.transform = CGAffineTransform(rotationAngle: $0.element)})
    //Auth View
    view.addSubview(authView)
    authView.pinEdgesToSuperView(leading: 0, trailing: 0, top: 0, bottom: 0)
    authView.isHidden = true
    segmentedView.items = "Signup Signin"
    updateUI()
  }
  
  func updateUI() {
    guard let isSignupState = Bool(exactly: NSNumber(value: segmentedView.selectedIndex)) else {
      fatalError("segmented view has more than 2 options")
    }
    authButton.setTitle(isSignupState ? "Sign in" : "Register", for: .normal)
    nameTextField.isHidden = isSignupState
    lastNameTextField.isHidden = isSignupState
  }
  
  func validateField(_ fieldType: Field) -> String? {
    //TODO validate name, lastName 3-15 chars. email is correctEmail (regex) password: 6-15 chars
    return "false"
  }
}

//MARK: Textfield delegates
extension OnboardingViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    switch textField {
      case textField where textField == nameTextField:
        lastNameTextField.becomeFirstResponder()
      case textField where textField == lastNameTextField:
        emailTextField.becomeFirstResponder()
      case textField where textField == emailTextField:
        passwordTextField.becomeFirstResponder()
      default: resignFirstResponder()
    }
    return true
  }
}

//MARK: Models
private extension OnboardingViewController {
  enum Field {
    case name
    case lastName
    case email
    case password
  }
}
