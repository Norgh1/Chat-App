//
//  UICollectionViewFlowLayoutExtension.swift
//  Chat-App
//
//  Created by Nor Gh on 16.08.22.
//

import UIKit

final class UICollectionViewFlowLayoutExtension: UICollectionViewFlowLayout {

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    scrollDirection = .horizontal
    itemSize = CGSize(width: 80, height: 80)
  }
  override init() {
    super.init()
  }
  
}
