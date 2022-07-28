//
//  NSObjectExtension.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import Foundation

extension NSObject {
    class var className: String {
        return String(describing: self.self)
    }
}
