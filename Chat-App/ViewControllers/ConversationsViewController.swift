//
//  ConversationsViewController.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import UIKit

class ConversationsViewController: UIViewController {
  
  @IBAction func logoutPressed(_ sender: Any) {
    Usermanager.shared.logout()
    Coordinator.showOnboarding()
  }
  
}













