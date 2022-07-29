//
//  CornerRadiusExtension.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import UIKit

@IBDesignable
extension UIView {
	
	@IBInspectable var cornerRadius: CGFloat {
		get { layer.cornerRadius }
		set { layer.cornerRadius = newValue }
	}
	
	
	
	
	
	
}

