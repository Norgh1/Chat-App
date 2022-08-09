//
//  MainButton.swift
//  Chat-App
//
//  Created by Nor Gh on 02.08.22.
//

import UIKit

final class MainButton: UIButton {
  
  //MARK: Public properties
  
  var isAnimating = false {
    didSet { updateUI() }
  }
  
  //MARK: Private properties
  private lazy var spinner: UIActivityIndicatorView = {
    let indicator = UIActivityIndicatorView()
    indicator.hidesWhenStopped = true
    indicator.color = .white
    self.addSubview(indicator)
    return indicator
  }()
  
  
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
    spinner.center = CGPoint(x: frame.size.width  / 2, y: frame.size.height / 2)
  }
  
  override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
    guard !isAnimating else { return }
    super.sendAction(action, to: target, for: event)
  }
}

//MARK: Private functions

private extension MainButton {
  func commonInit() {
    
    let backgroundView = UIView()
    addSubview(backgroundView)
    backgroundView.isUserInteractionEnabled = false
    backgroundView.pinEdgesToSuperView(leading: 0, trailing: 0, top: 0, bottom: 0)
    backgroundView.backgroundColor = .systemBlue
    backgroundView.clipsToBounds = true
    backgroundView.cornerRadius = 10
    
    tintColor = .white
    layer.shadowColor = UIColor.systemBlue.cgColor
    layer.shadowRadius = 10
    layer.shadowOpacity = 0.3
    updateUI()
  }
  
  func updateUI() {
    isAnimating ? spinner.startAnimating() : spinner.stopAnimating()
    titleLabel?.isHidden = isAnimating
  }
}
//
