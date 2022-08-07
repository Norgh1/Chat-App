//
//  ConversationsViewController.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import UIKit

final class ConversationsViewController: UIViewController {
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		commonInit()
		view.backgroundColor = .white
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()

	}

}

private extension ConversationsViewController {
	func commonInit() {
		
		//MARK: Navigation Bar
		
		let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
		navBar.barTintColor = UIColor.systemGray5
		view.addSubview(navBar)
		let navItem = UINavigationItem(title: "XChat")
		navItem.largeTitleDisplayMode = .always
		let buttonBar = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .done, target: nil, action: nil)
		navItem.rightBarButtonItem = buttonBar
		navBar.setItems([navItem], animated: false)
		
	
	}
}
	

