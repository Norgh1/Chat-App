	//
	//  SliderView.swift
	//  Chat-App
	//
	//  Created by Nor Gh on 28.07.22.
	//

import UIKit

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
	
	@objc func swipeRight(recognizer: UIPanGestureRecognizer) {
		if recognizer.state == .changed {
			print("!!!")
		}
	}
	
	@objc func swipeRightTwo(recognize: UISwipeGestureRecognizer) {
		if recognize.state == .cancelled {
			print("print")
		}
	}
	
}

	//MARK: Private methods
private extension SliderView {
	func commonInit() {
		let button = UIButton()
		

			//TODO UI

		
		button.cornerRadius = 10
		button.contentMode = .top
		button.backgroundColor = .white
		button.isUserInteractionEnabled = true
		button.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(swipeRight(recognizer:))))
		
		
	
		
		addSubview(button)
		button.pinEdgesToSuperView(leading: 20, trailing: nil, top: 20, bottom: -20)
//		self.cornerRadious
//		placeholder label
//		rounded view
//		horizontal constraint
//		gesture panRecognizer
//		horizontal constraint value
//		gesure if ended check if finished sliding
		button.sendActions(for: .valueChanged)
	}
}
