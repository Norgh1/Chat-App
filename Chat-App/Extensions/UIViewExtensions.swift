//
//  UIViewExtensions.swift
//  Chat-App
//
//  Created by Nor Gh on 29.07.22.
//

import UIKit

extension UIView {
	func pinEdgesToSuperView(leading: CGFloat?, trailing: CGFloat?, top: CGFloat?, bottom: CGFloat?) {
		guard let superView = self.superview else {
			assertionFailure("superview not found")
			return
		}
		translatesAutoresizingMaskIntoConstraints = false
		if let leading = leading {
			leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: leading).isActive = true
		}
		if let trailing = trailing {
			trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: trailing).isActive = true
		}
		if let top = top {
			topAnchor.constraint(equalTo: superView.topAnchor, constant: top).isActive = true
		}
		if let bottom = bottom {
			bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: bottom).isActive = true
		}
	}
	
	func fadeIn(duration: TimeInterval = 0.3, completion: ((Bool) -> Void)? = nil) {
		self.alpha = 0
		isHidden = false
		UIView.animate(withDuration: duration, animations: {
			self.alpha = 1
		}, completion: completion)
	}
	
	func fadeOut(duration: TimeInterval = 0.3, completion: ((Bool) -> Void)? = nil) {
		UIView.animate(withDuration: duration, animations: {
			self.alpha = 0
		}) { status in
			self.isHidden = true
			completion?(status)
		}
	}
}


