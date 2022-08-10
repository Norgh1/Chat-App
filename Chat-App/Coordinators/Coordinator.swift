	//
	//  Coordinator.swift
	//  Chat-App
	//
	//  Created by Nor Gh on 28.07.22.
	//

import UIKit

final class Coordinator {
  
  private static var window: UIWindow? {
    return (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window
  }
  
	static func showOnboarding() {
    let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: OnboardingViewController.className)
    window?.rootViewController = controller
	}
	
	static func showConversations() {
    let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "conversations")
    window?.rootViewController =  controller
  }
}
