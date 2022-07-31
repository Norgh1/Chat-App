	//
	//  SliderView.swift
	//  Chat-App
	//
	//  Created by Nor Gh on 28.07.22.
	//

import UIKit
import QuartzCore

final class SliderView: UIControl {
	
		//MARK: Public properties
	private(set) var isSlided = false
	
		//MARK: Private properties
	
		//MARK: Inits
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		commonInit()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	@objc func swipeGesture(recognizer: UIPanGestureRecognizer) {
		if recognizer.state == .ended {
			print("Recognizer hes ended")
		}
	}
	
		
}

	//MARK: Private methods
private extension SliderView {
	func commonInit() {
		
			//TODO UI
		
		let textFld = UITextField()
		textFld.translatesAutoresizingMaskIntoConstraints = false
		textFld.placeholder = "Swipe to start..."
		

		let button = UIButton()
		button.cornerRadius = 10
		button.backgroundColor = .white
		button.isUserInteractionEnabled = true
		button.layer.borderColor = UIColor.black.cgColor
		button.layer.borderWidth = 3.0
		
		//MARK: Gesture recognizer
		
		let pan = UIPanGestureRecognizer(target: self, action: #selector(swipeGesture(recognizer:)))
		button.addGestureRecognizer(pan)
		addSubview(button)
		addSubview(textFld)
		button.pinEdgesToSuperView(leading: 30, trailing: nil, top: 20, bottom: -20)
		button.sendActions(for: .valueChanged)
//		self.cornerRadious
//		placeholder label
//		rounded view
//		horizontal constraint
//		gesture panRecognizer
//		horizontal constraint value
//		gesure if ended check if finished sliding
		
	}
}
