//
//  CornerRadiusExtension.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import UIKit


extension UIView {
    
    @IBInspectable var cornerRadious: CGFloat {
        get {
            return layer.cornerRadius   
        }
        set {
            layer.cornerRadius = CGFloat(newValue)
        }
    }
}

