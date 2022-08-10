//
//  InitialViewController.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import UIKit

final class InitialViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      Usermanager.shared.isSignedIn() ? Coordinator.showConversations() : Coordinator.showOnboarding()
    }
}
