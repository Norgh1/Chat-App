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
	public var buttonInset: CGFloat = 10
	
	//MARK: Private properties
	private let buttonView = UIImageView()
	private var leadingConstraint: NSLayoutConstraint?
	private var maxSize: CGFloat { return bounds.width - buttonInset - buttonInset - buttonView.bounds.width }
	
	//MARK: Inits
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		commonInit()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		layer.cornerRadius = bounds.height / 2
		buttonView.layer.cornerRadius = (bounds.height - buttonInset - buttonInset) / 2
	}
}

	//MARK: Private methods
private extension SliderView {
	func commonInit() {
		backgroundColor = .systemBlue
		clipsToBounds = true
		//Placeholder configfuration
		let label = UILabel()
		label.text = "Swipe to start..."
		label.font = .systemFont(ofSize: 20, weight: .bold)
		label.adjustsFontSizeToFitWidth = true
		label.textAlignment = .center
		label.textColor = .white
		label.alpha = 0.8
		addSubview(label)
		label.pinEdgesToSuperView(leading: 0, trailing: 0, top: 0, bottom: 0)
		
		//Button configfuration
		buttonView.backgroundColor = .white
		buttonView.tintColor = .systemBlue
		buttonView.image = UIImage(systemName: "chevron.forward")
		addSubview(buttonView)
		buttonView.pinEdgesToSuperView(leading: nil, trailing: nil, top: buttonInset, bottom: -buttonInset)
		leadingConstraint = NSLayoutConstraint.init(item: self, attribute: .left, relatedBy: .equal, toItem: buttonView, attribute: .left, multiplier: 1.0, constant: -buttonInset)
		leadingConstraint?.isActive = true
		buttonView.heightAnchor.constraint(equalTo: buttonView.widthAnchor).isActive = true
		buttonView.isUserInteractionEnabled = true
		let panGesture = UIPanGestureRecognizer(target: self, action: #selector(buttonSwiped(_:)))
		buttonView.addGestureRecognizer(panGesture)
	}
	
	@objc func buttonSwiped(_ recognizer: UIPanGestureRecognizer) {
		switch recognizer.state {
			case .changed:
				let translation = max(min(recognizer.translation(in: self).x, maxSize), buttonInset)
				leadingConstraint?.constant = -translation
				layoutIfNeeded()
			case .ended, .cancelled, .failed:
				if abs(leadingConstraint?.constant ?? 0) == maxSize {
					sendActions(for: .valueChanged)
				}
				leadingConstraint?.constant = -buttonInset
				UIView.animate(withDuration: 0.3) {
					self.layoutIfNeeded()
				}
			default: break
		}
	}
}
