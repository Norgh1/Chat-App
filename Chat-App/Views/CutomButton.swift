//
//  CutomButton.swift
//  Chat-App
//
//  Created by Nor Gh on 06.08.22.
//

import UIKit

 final class CutomButton: UIButton {

	 //MARK: Public properties
	 
	 var isAnimating = false {
		 didSet { updateUI() }
	 }
	 //MARK: Private Proparies
	 
	 private lazy var spinner: UIActivityIndicatorView = {
		 let indicator = UIActivityIndicatorView()
		 indicator.hidesWhenStopped = true
		 indicator.style = .large
		 indicator.color = .white
		 self.addSubview(indicator)
		 return indicator
	 }()
	 
	 
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
		 spinner.center = CGPoint(x: frame.size.width  / 2, y: frame.size.height / 2)
	 }
 

	 override func sendAction(_ action: Selector, to targer: Any?, for event: UIEvent?) {
		 guard !isAnimating else { return }
		 super.sendAction(action, to: targer, for: event)
	 }
}

private extension CutomButton {
	func commonInit() {
		
		backgroundColor = .systemBlue
		layer.cornerRadius = 10
		clipsToBounds = true
		translatesAutoresizingMaskIntoConstraints = false
		tintColor = .white
		setTitle("Registration", for: .normal)
		setTitleShadowColor(UIColor.systemBlue, for: .normal)
		setTitleColor(.white, for: .normal)
		
		
		layer.shadowColor = UIColor.systemBlue.cgColor
		layer.shadowRadius = 10
		layer.shadowOpacity = 0.3
		updateUI()
		
		
	}
	
	
	func updateUI() {
		isAnimating ? spinner.startAnimating() : spinner.stopAnimating()
		titleLabel?.isHidden = isAnimating
	}
}
