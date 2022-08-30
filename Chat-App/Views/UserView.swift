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
  var imageView = UIImageView()
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
    layer.cornerRadius = frame.size.height / 2
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
    //layer.cornerRadius = frame.size.width / 2
    backgroundColor = .systemGray6
    clipsToBounds = true
    
    addSubview(imageView)
    imageView.pinEdgesToSuperView(leading: 0, trailing: 0, top: 0, bottom: 0)
    imageView.contentMode = .scaleAspectFill
    statusView.backgroundColor = .systemGreen
    addSubview(statusView)
    statusView.pinEdgesToSuperView(leading: nil, trailing: 0, top: nil, bottom: 0)
    statusView.heightAnchor.constraint(equalToConstant: 8).isActive = true
    statusView.widthAnchor.constraint(equalToConstant: 8).isActive = true
    statusView.layer.cornerRadius = 4
    statusView.clipsToBounds = true
  }
}
