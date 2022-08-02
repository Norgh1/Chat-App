	//
	//  SliderView.swift
	//  Chat-App
	//
	//  Created by Nor Gh on 28.07.22.
	//

import UIKit

final class SliderView: UIControl {
	
		//MARK: Public properties
	private(set) var isSlided = true
	
		//MARK: Private properties
	
	//private var button
	
	
		//MARK: Inits
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		commonInit()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	@objc func swipe( _ recognizer: UIPanGestureRecognizer) {
		if recognizer.state == .ended {
			print("Swiped")
		}
	}
	

		
}


	//MARK: Private methods
private extension SliderView {
	func commonInit() {
			//TODO UI
	
		//MARK: PlaceHolder

			let textFld = UITextField()
			textFld.translatesAutoresizingMaskIntoConstraints = false
			let placeHolderString:String = "Swipe to start..."
			textFld.attributedPlaceholder = NSAttributedString(string: placeHolderString,
																												 attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
			addSubview(textFld)


		//MARK: Button
		
		let button = UIButton()
		button.cornerRadius = 10
		button.backgroundColor = .white
		button.isUserInteractionEnabled = true
		button.layer.borderColor = UIColor.systemGray.cgColor
		button.layer.borderWidth = 1.0
		button.clipsToBounds = true
		
		
		//MARK: Gesture recognizer

		let pan = UIPanGestureRecognizer(target: self, action: #selector(swipe(_:)))
		button.addGestureRecognizer(pan)
		addSubview(button)
		addSubview(textFld)
		
		
		
		textFld.pinEdgesToSuperView(leading: 90, trailing: nil, top: 30 , bottom: -30)
		button.pinEdgesToSuperView(leading: 15, trailing: nil, top: 15 , bottom: -20)
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


