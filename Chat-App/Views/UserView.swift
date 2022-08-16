//
//  UserView.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/16/22.
//

import UIKit
import Kingfisher

final class UserView: UIView {
  
  //MARK: Public properties
  var user: ObjectUser? {
    didSet { updateUI() }
  }
  
  //MARK: Private properties
  let imageView = UIImageView()
  let statusView = UIView()
  
  //MARK: Inits
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
    layer.cornerRadius = bounds.height / 2
  }
}

//MARK: Private methods
private extension UserView {
  func updateUI() {
    imageView.kf.cancelDownloadTask()
    guard let user = user else {
      statusView.isHidden = true
      imageView.image = nil
      return
    }
    imageView.kf.setImage(with: URL(string: user.profileImageURL ?? ""))
    statusView.isHidden = !user.isActive
  }
  
  func commonInit() {
    backgroundColor = .systemGray6
    clipsToBounds = true
    
    addSubview(imageView)
    imageView.pinEdgesToSuperView(leading: 10, trailing: -10, top: 10, bottom: -10)
    imageView.contentMode = .scaleAspectFit
    statusView.backgroundColor = .systemGreen
    addSubview(statusView)
    statusView.pinEdgesToSuperView(leading: nil, trailing: 0, top: nil, bottom: 0)
    statusView.heightAnchor.constraint(equalToConstant: 8).isActive = true
    statusView.widthAnchor.constraint(equalToConstant: 8).isActive = true
    statusView.layer.cornerRadius = 4
    statusView.clipsToBounds = true
  }
}
