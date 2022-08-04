	//
	//  OnboardingViewController.swift
	//  Chat-App
	//
	//  Created by Nor Gh on 28.07.22.
	//

import UIKit

final class OnboardingViewController: UIViewController {
	
	@IBOutlet weak var segmentedView: SegmetedView!
	
	@IBAction func segmentPressed(_ sender: SegmetedView) {
		print(sender.selectedIndex)
	}
	
	
	@IBAction func buttonPressed(_ sender: Any) {
		textFld.isHidden.toggle()
	}
	
	//MARK: IBOutlets
	@IBOutlet var authView: UIView!
	@IBOutlet var textFld: UITextField!
	@IBOutlet var textFldTwo: UITextField!
	
	//MARK: LifeCycle
	override func viewDidLoad() {
		super.viewDidLoad()
		textFld.delegate = self
		textFldTwo.delegate = self
		customization()
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
		textField.resignFirstResponder()
		print("Text fls did end editing, delegation works!")
		return true
	}
	
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		print("Text filed is Editing!")
	}
	
	func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
		print("Did end Editing!")
	}
	
}
