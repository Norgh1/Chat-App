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
	@IBAction func buttonPressed(_ sender: CutomButton) {
			sender.isAnimating.toggle()
			Coordinator.showConversations(from: self)
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
		print(sender.selectedIndex)
		switch sender.selectedIndex {
			case 0:
				authButton.setTitle("Registration", for: .normal)
				nameTextField.isHidden = false
				lastNameTextField.isHidden = false
				passwordTextField.isSecureTextEntry = true
				print("case 0")
			case 1:
				authButton.setTitle("Sign In", for: .normal)
				nameTextField.isHidden = true
				lastNameTextField.isHidden = true
				passwordTextField.isSecureTextEntry = true
				print("case 1")
			default:break
		}
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
		segmentedView.items = "SignUp SignIn"
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
