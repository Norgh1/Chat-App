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
        if Usermanager.shared.isSignedIn() {
            Coordinator.showConversations(from: self)
            return
        }
        Coordinator.showOnboarding(from: self)
    }
}
