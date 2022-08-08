//
//  ConversationCell.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import UIKit

final class ConversationCell : UICollectionViewCell  {
		
    static let identifire = "ConversationCell"
    
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.backgroundColor = .yellow
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
    
}
