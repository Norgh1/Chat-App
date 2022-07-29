//
//  OnboardingViewController.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO: create UI
        createUI()
    }
    
    @IBAction func didSlide(_ sender: SliderView) {
        if sender.isSlided {
            Coordinator.showOnboarding(from: self)
        } 
        
    }

    
    private func createUI() {
        if let lion = view.viewWithTag(1) as? UILabel {
            lion.text = "🦁"
            lion.transform = CGAffineTransform(rotationAngle: CGFloat.pi - 35)
        }
        
        if let cat = view.viewWithTag(2) as? UILabel {
            cat.text = "🐱"
            cat.transform = CGAffineTransform(rotationAngle: CGFloat.pi + 35)
        }

        if let mouse = view.viewWithTag(3) as? UILabel {
            mouse.text = "🐭"
            mouse.transform = CGAffineTransform(rotationAngle: CGFloat.pi - 16)
        }

        if let foxy = view.viewWithTag(4) as? UILabel {
            foxy.text = "🦊"
            foxy.transform = CGAffineTransform(rotationAngle: CGFloat.pi + -3)
        }

        if let n = view.viewWithTag(5) as? UILabel {
            n.text = "🐨"
            n.transform = CGAffineTransform(rotationAngle: CGFloat.pi - 34)
        }

        if let xchatLabel = view.viewWithTag(6) as? UILabel {
            xchatLabel.text = "Xchat"
            xchatLabel.textAlignment = .center
            xchatLabel.numberOfLines = 1
        }
        if let icon = view.viewWithTag(7) as? UIImageView {
            icon.image = UIImage(named: "image")
        }
        if let slider = view.viewWithTag(8) as? SliderView {
            print("This is an my slider :\(slider)")
            //view.addSubview(slider)
        }
    }
}


