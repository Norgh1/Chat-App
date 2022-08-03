//
//  NSStringExtension.swift
//  Chat-App
//
//  Created by Nor Gh on 03.08.22.
//

import UIKit

extension NSAttributedString {
	func size(preferredWidth: CGFloat = .greatestFiniteMagnitude, preferredHeight: CGFloat = .greatestFiniteMagnitude) -> CGSize {
		let maxSize = CGSize(width: preferredWidth, height: preferredHeight)
		let framesetter = CTFramesetterCreateWithAttributedString(self)
		return CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRange(), nil, maxSize, nil)
	}
}
