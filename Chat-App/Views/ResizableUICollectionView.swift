//
//  ResizableUICollectionView.swift
//  Chat-App
//
//  Created by Nor Gh on 03.08.22.
//

import UIKit

final class ResizableUICollectionView: UICollectionView {
	
	override var isScrollEnabled: Bool {
		get { return false }
		set { }
	}
	
	override var intrinsicContentSize: CGSize {
		get { return contentSize }
		set { }
	}
	
	
	
}
