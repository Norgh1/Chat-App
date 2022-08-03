	//
	//  Coordinator.swift
	//  Chat-App
	//
	//  Created by Nor Gh on 28.07.22.
	//

import UIKit

final class Coordinator {
	
	static func showOnboarding(from vc: UIViewController) {
		let controller = vc.storyboard?.instantiateViewController(withIdentifier: OnboardingViewController.className)
		vc.present(controller!, animated: true)
		
	}
	
	static func showConversations(from vc: UIViewController) {
		let controller = vc.storyboard?.instantiateViewController(withIdentifier: ConversationsViewController.className)
		vc.present(controller!, animated: true)
		
	}
}
