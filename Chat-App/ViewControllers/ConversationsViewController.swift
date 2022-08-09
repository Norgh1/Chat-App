//
//  ConversationsViewController.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import UIKit

class ConversationsViewController: UIViewController {

    //MARK: private proparties

    private let messegeButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 42), forImageIn: .normal)
        button.frame = CGRect(x: 340, y: 35, width: 40, height: 40)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
}

//MARK: Private func

private extension ConversationsViewController {
    
    private func commonInit() {
        
        //MARK: UIView
        let myView : UIView = {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 190))
            view.backgroundColor = .systemGray5
            
            //MARK: Label
            
            let xChatLabel = UILabel(frame: CGRect(x: 15, y: 15, width: 200, height: 70))
            xChatLabel.text = "Xchat Messege"
            xChatLabel.textColor = .black
            xChatLabel.font = UIFont.boldSystemFont(ofSize: 23)
            //xChatLabel.backgroundColor = .black
            view.addSubview(xChatLabel)
            view.addSubview(messegeButton)
            return view
        }()
        view.addSubview(myView)
    }
    
    
}
















