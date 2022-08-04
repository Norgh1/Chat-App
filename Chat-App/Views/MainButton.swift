//
//  MainButton.swift
//  Chat-App
//
//  Created by Nor Gh on 02.08.22.
//

import UIKit

final class MainButton: UIButton {
	
	private let button = UIButton()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		commonInit()
	}
	
	
	//shadow
	// spinner animation
	//change mode either text or loading
	
	
}


private extension MainButton {
	func commonInit() {
		
		// Button
		button.backgroundColor = .systemBlue
		button.setTitle("Button", for: .normal)
		button.titleLabel?.font =  UIFont(name: "Apple SD Gothic Neo Heavy", size: 20)
		button.titleLabel?.textColor = .black
		button.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.25)
		button.layer.masksToBounds = false
		addSubview(button)
		button.pinEdgesToSuperView(leading: 0, trailing: 0, top: 0, bottom: 0)
		
	}
	
}
