	//
	//  OnboardingViewController.swift
	//  Chat-App
	//
	//  Created by Nor Gh on 28.07.22.
	//

import UIKit

final class OnboardingViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureViews()
	}
	
	@IBAction func didSlide(_ sender: SliderView) {
		if sender.isSlided {
			Coordinator.showOnboarding(from: self)
		}
		
	}
	
	
	private func configureViews() {
		let rotatingValues = [CGFloat.pi - 4, CGFloat.pi - 3, CGFloat.pi - 3	, CGFloat.pi + -3, CGFloat.pi - 3]
		rotatingValues.enumerated().forEach({view.viewWithTag($0.offset + 1)?.transform = CGAffineTransform(rotationAngle: $0.element)})
		
	}
}


