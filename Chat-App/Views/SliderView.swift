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
	
}

	//MARK: Private methods
private extension SliderView {
	func commonInit() {
		let button = UIButton()
		addSubview(button)
		button.pinEdgesToSuperView(leading: 10, trailing: nil, top: 5, bottom: -10)
			//TODO UI
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
