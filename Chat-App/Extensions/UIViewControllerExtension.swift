//
//  UIViewControllerExtension.swift
//  Chat-App
//
//  Created by Nor Gh on 10.08.22.
//

import UIKit

extension UIViewController {
  func showAlert(title: String? = nil, message: String? = nil) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default))
    present(alert, animated: true)
  }
}
