//
//  KeyboardHandleable.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 9/5/22.
//

import UIKit

protocol KeyboardHandleable: UIViewController {
  
  var bottomConstraint: NSLayoutConstraint! { get }
  func observeKeyboard()
  
}

extension KeyboardHandleable {
  func observeKeyboard() {
    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { notification in
      self.handleKeyboard(notification: notification)
    }
    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { notification in
      self.handleKeyboard(notification: notification)
    }
  }
 
  private func handleKeyboard(notification: Notification) {
    guard let userInfo = notification.userInfo else { return }
    guard let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
    bottomConstraint.constant = notification.name == UIResponder.keyboardWillHideNotification ? 0 : keyboardFrame.height - view.safeAreaInsets.bottom
    UIView.animate(withDuration: 0.3) {
      self.view.layoutIfNeeded()
    }
  }
}
