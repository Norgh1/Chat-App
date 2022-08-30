//
//  PlaceholderCell.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/16/22.
//

import UIKit

final class PlaceholderCell: UICollectionViewCell {
  
  @IBOutlet weak var spinner: UIActivityIndicatorView!
  @IBOutlet weak var imageView: UIImageView!
  
  func configure(_ mode: State) -> PlaceholderCell {
    switch mode {
      case .inital:
        spinner.startAnimating()
        imageView.isHidden = true
      case .noItems, .networkError:
        spinner.stopAnimating()
        imageView.image = mode == .networkError ? UIImage(systemName: "network") : UIImage(systemName: "tray.fill")
        imageView.isHidden = false
      case .normal:
        fatalError("can not display normal state")
    }
    return self
  }
}
