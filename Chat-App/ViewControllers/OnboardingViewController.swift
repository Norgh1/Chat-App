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
  
  //MARK: Private properties
  private var state = Mode.signIn {
    didSet { updateUI() }
  }
  //MARK: LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    customization()
    state = .signUp
  }
  
  @IBAction func buttonPressed(_ sender: MainButton) {
    switch state {
    case .signIn: signIn()
    case .signUp: signUp()
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
    guard let state = Mode(rawValue: sender.selectedIndex) else {
      fatalError("To many cases")
    }
    self.state = state
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
  }
  
  func updateUI() {
    guard let isSignupState = Bool(exactly: NSNumber(value: segmentedView.selectedIndex)) else {
      fatalError("segmented view has more than 2 options")
    }
    authButton.setTitle(isSignupState ? "SignIn" : "SignUp", for: .normal)
    nameTextField.isHidden = isSignupState
    lastNameTextField.isHidden = isSignupState
  }
  
  func validateField(_ fieldType: Field) -> String? {
    switch fieldType {
    case .name:
      if let name = nameTextField.text, (3...15).contains(name.count) {
        return name
      }
      showAlert(title: "Hey!", message: "your name is missing")
    case .lastName:
      if let lastName = lastNameTextField.text, (3...15).contains(lastName.count) {
        return lastName
      }
      showAlert(title: "Hey!", message: "your last name is missing")
    case .email:
      if let email = emailTextField.text, email.isValidEmail {
        return email
      }
      showAlert(title: "Hey!", message: "your email is missing")
    case .password:
      if let password = passwordTextField.text, (3...15).contains(password.count) {
        return password
      }
      showAlert(title: "Hey!", message: "your password is missing")
    }
    return nil
  }
}

//MARK: Auth methods
private extension OnboardingViewController {
  func signUp() {
    guard let name = validateField(.name) else { return }
    guard let lastName = validateField(.lastName) else { return }
    guard let email = validateField(.email) else { return }
    guard let password = validateField(.password) else { return }
    authButton.isAnimating = true
    Usermanager.shared.signup(name: name, lastName: lastName, email: email, password: password) {[weak self] response in
      self?.handle(response)
    }
  }
  
  func signIn() {
    guard let email = validateField(.email) else { return }
    guard let password = validateField(.password) else { return }
    authButton.isAnimating = true
    Usermanager.shared.signin(email: email, password: password) { [weak self] response in
      self?.handle(response)
    }
  }
  
  func handle(_ response: NetworkStatus<Void>) {
    authButton.isAnimating = false
    switch response {
    case .success:
      Coordinator.showConversations(from: self)
    case .generalError:
      showAlert(title: "Oops!", message: "Something went wrong")
    case .noConnection:
      showAlert(title: "Oops!", message: "Please check you connection")
    }
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
  
  enum Mode: Int {
    case signUp
    case signIn
  }
}
