//
//  ConversationsViewController.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import UIKit

class ConversationsViewController: UIViewController {
	
	//MARK: private proparties
	
	private var collectionView: UICollectionView?
    
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
	
	func commonInit() {
        
        setupCollectionView()
        
        //MARK: Navigation Bar
        
		let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0,
                                                   width: view.frame.width,
                                                   height: view.frame.height))
		navBar.barTintColor = UIColor.systemGray5
		view.addSubview(navBar)
        let navItem = UINavigationItem(title: "XChat Messegner")
        navItem.titleView?.tintColor = .red
		navItem.largeTitleDisplayMode = .always
		let buttonBar = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"),
																		style: .done,
																		target: nil,
																		action: nil)
		navItem.rightBarButtonItem = buttonBar
		navBar.setItems([navItem], animated: false)
	}
    
    // MARK: UICollectionView
    
    func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        collectionView.register(ConversationCell.self, forCellWithReuseIdentifier: ConversationCell.identifire)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }
    
    
}

extension ConversationsViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: ConversationCell.identifire, for: indexPath) as! ConversationCell
        return myCell
    }
}
