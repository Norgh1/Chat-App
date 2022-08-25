//
//  MessageCell.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/23/22.
//

import UIKit

final class MessageCell: UICollectionViewCell {
  
  @IBOutlet weak var messageLabel: UILabel!
  
  func configure(_ message: ObjectMessage) -> MessageCell {
    configureUI()
    messageLabel.text = message.content
    return self
  }
}

extension MessageCell {
  private func configureUI() {
    messageLabel.font = .boldSystemFont(ofSize: 15)
  }
}
