//
//  MainButton.swift
//  Chat-App
//
//  Created by Nor Gh on 02.08.22.
//

import UIKit

final class MainButton: UIButton {
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		commonInit()
	}
	

	override func layoutSubviews() {
		super.layoutSubviews()
	}
	
	// shadow
	// spinner animation
	// change mode either text or loading
	
	
	
}


private extension MainButton {
	func commonInit() {
		
		
		
		// Button
		let button = UIButton()
		button.backgroundColor = .systemBlue
		button.setTitle("Button", for: .normal)
		button.titleLabel?.font =  UIFont(name: "Apple SD Gothic Neo Heavy", size: 20)
		button.titleLabel?.textColor = .black
		button.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.25)
		//button.layer.masksToBounds = false
		
		
		//shadow
		button.layer.shadowOffset = CGSize(width: 12, height: 23)
		button.layer.shadowColor = UIColor(displayP3Red: 34, green: 34, blue: 34, alpha: 34).cgColor
		addSubview(button)
		button.pinEdgesToSuperView(leading: 0, trailing: 0, top: 0, bottom: 0)
		
	}
	
	// indicator view
	private func showActivityIndicator() {
		let activityView = UIActivityIndicatorView(style: .medium)
		activityView.center = self.center
		addSubview(activityView)
		activityView.pinEdgesToSuperView(leading: 20, trailing: 0, top: -0, bottom: -0)
		activityView.startAnimating()
	}
	
//	func hideActivityIndicator(){
//		if (activityView != nil){
//			activityView?.stopAnimating()
//		}
//	}

}

