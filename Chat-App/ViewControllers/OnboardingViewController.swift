//
//  OnboardingViewController.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import UIKit

final class OnboardingViewController: UIViewController {

    @IBOutlet weak var lionLabel: UILabel!
    @IBOutlet weak var foxLabel: UILabel!
    @IBOutlet weak var mouseLabel: UILabel!
    @IBOutlet weak var catLabel: UILabel!
    @IBOutlet weak var rhinocerosLabel: UILabel!
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var slider: SliderView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO: create UI
        
        self.view.backgroundColor = .systemBlue
        self.sliderView.layer.cornerRadius = 35
        self.slider.layer.cornerRadius = 35
        rotateEmojis()
        setConstraintsEmojis()
    }
    
    @IBAction func didSlide(_ sender: SliderView) {
        if sender.isSlided {
            Coordinator.showOnboarding(from: self)
        }
        
    }
    

//MARK: Emoji Transform
    
    private func rotateEmojis() {
        lionLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / -8)
        mouseLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / -28)
        catLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 30)
        rhinocerosLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 7)
    }

//MARK: Emoji Constriants
    
    private func setConstraintsEmojis() {
        
        NSLayoutConstraint.activate([
        
        
        
        ])
        
    }
}

