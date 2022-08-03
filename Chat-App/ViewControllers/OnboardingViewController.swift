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
	
	
	//MARK: LifeCycle
	override func viewDidLoad() {
		super.viewDidLoad()
		configureViews()
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
	
	
	func configureViews() {
		//Emojies
		let rotatingValues = [CGFloat.pi - 4, CGFloat.pi - 3, CGFloat.pi - 3	, CGFloat.pi + -3, CGFloat.pi - 3]
		rotatingValues.enumerated().forEach({view.viewWithTag($0.offset + 1)?.transform = CGAffineTransform(rotationAngle: $0.element)})
		//Auth View
		view.addSubview(authView)
		authView.pinEdgesToSuperView(leading: 0, trailing: 0, top: 0, bottom: 0)
		authView.isHidden = true
	}
}

//MARK: Textfield delegates
//extension OnboardingViewController: UITextFieldDelegate {
//	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//		
//	}
//	
//	
//}
