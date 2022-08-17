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
  
  static func showEditProfile(from vc: UIViewController) {
    let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: EditProfileViewController.className)
    vc.present(controller, animated: true)
  }
  
  static func showCompose(from vc: UIViewController) {
    let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: UserComposeViewController.className)
    vc.present(controller, animated: true)
  }
  
  static func showMessages(conversationId: String, from vc: UIViewController) {
    let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: MessagesViewController.className) as! MessagesViewController
    controller.conversationId = conversationId
    vc.show(controller, sender: vc)
  }
}
