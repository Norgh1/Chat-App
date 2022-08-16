//
//  ConversationCell.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import UIKit

final class ConversationCell : UICollectionViewCell  {
    
  static let id = "ConversationCell"
  
  
  
  
  
  let myImageView : UIImageView = {
    let imageView = UIImageView()
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    
    imageView.layer.masksToBounds = true
    imageView.layer.cornerRadius = 80 / 2
    imageView.backgroundColor = .clear
    return imageView
  }()
  

  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.clipsToBounds = true
    contentView.addSubview(myImageView)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override class func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    myImageView.frame = contentView.bounds
  }
  
}

extension ConversationCell {
  func configure(with name: UserModel) {
    myImageView.image = name.image    
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    myImageView.image = nil
  }
}
