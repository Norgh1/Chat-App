//
//  SegmentedView.swift
//  Chat-App
//
//  Created by Nor Gh on 02.08.22.
//

import UIKit

final class SegmetedView: UIControl {
	
	//MARK: Public properties
	var items = "" {
		didSet {
			contentItems = items.components(separatedBy: .whitespacesAndNewlines).map({$0})
			collectionView.reloadData()
			selectedIndex = 0
			updateIndicatorPosition()
		}
	}
	var selectedIndex = 0
	
	override var intrinsicContentSize: CGSize {
		get {
			let width = contentItems.map({SegmentCell.widthFor($0, preferredHeight: 50)}).reduce(0, +)
			return CGSize(width: width, height: 50)
		}
		set {}
	}
	
	//MARK: Private properties
	private var contentItems = [String]()
	private lazy var indicatorView: UIView = {
		let indicator = UIView()
		indicator.backgroundColor = .systemBlue
		return indicator
	}()
	private lazy var collectionView: ResizableUICollectionView = {
		let flow = UICollectionViewFlowLayout()
		flow.minimumLineSpacing = 0
		flow.minimumInteritemSpacing = 0
		flow.scrollDirection = .horizontal
		let collection = ResizableUICollectionView(frame: .zero, collectionViewLayout: flow)
		collection.isScrollEnabled = false
		collection.backgroundColor = .clear
		collection.register(SegmentCell.self, forCellWithReuseIdentifier: SegmentCell.className)
		collection.delegate = self
		collection.dataSource = self
		return collection
	}()
	private var indicatorLeadingConstraint: NSLayoutConstraint?
	private var indicatorWidthConstraint: NSLayoutConstraint?
	
	//MARK: inits
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		commonInit()
	}
}

//MARK: Private functions
private extension SegmetedView {
	func commonInit() {
		backgroundColor = .clear
		addSubview(collectionView)
		collectionView.pinEdgesToSuperView(leading: 0, trailing: 0, top: 0, bottom: 0)
		
		addSubview(indicatorView)
		indicatorView.pinEdgesToSuperView(leading: nil, trailing: nil, top: nil, bottom: 0)
		indicatorView.heightAnchor.constraint(equalToConstant: 3).isActive = true
		self.indicatorLeadingConstraint = NSLayoutConstraint(item: indicatorView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0)
		self.indicatorLeadingConstraint?.isActive = true
		self.indicatorWidthConstraint = indicatorView.widthAnchor.constraint(equalToConstant: 40)
		self.indicatorWidthConstraint?.isActive = true
	}
	
	func updateIndicatorPosition() {
		let width = contentItems.prefix(selectedIndex).map({SegmentCell.widthFor($0, preferredHeight: 50)}).reduce(0, +)
		indicatorLeadingConstraint?.constant =  width
		indicatorWidthConstraint?.constant = SegmentCell.widthFor(contentItems[selectedIndex], preferredHeight: 50)
		UIView.animate(withDuration: 0.3) {
			self.layoutIfNeeded()
		}
	}
}

//MARK: UICollectionView methods
extension SegmetedView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		guard selectedIndex != indexPath.row else { return }
		selectedIndex = indexPath.row
		sendActions(for: .valueChanged)
		collectionView.visibleCells.forEach { cell in
			guard let cell  = cell as? SegmentCell else { return }
			cell.set(isSelected: (collectionView.indexPath(for: cell)?.row ?? 0) == selectedIndex ? true : false)
		}
		updateIndicatorPosition()
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width = SegmentCell.widthFor(contentItems[indexPath.row], preferredHeight: collectionView.bounds.height)
		return CGSize(width: width, height: collectionView.bounds.height)
	}
}

extension SegmetedView: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return contentItems.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SegmentCell.className, for: indexPath) as! SegmentCell
		return cell.configure(contentItems[indexPath.row], isSelected: indexPath.row == selectedIndex)
	}
}

//MARK: Models
private extension SegmetedView {
	
	final class SegmentCell: UICollectionViewCell {
		
		let titleLabel = UILabel()
		
		override init(frame: CGRect) {
			super.init(frame: frame)
			commonInit()
		}
		
		required init?(coder: NSCoder) {
			super.init(coder: coder)
			commonInit()
		}
		
		func configure(_ title: String, isSelected: Bool) -> SegmentCell {
			titleLabel.text = title
			titleLabel.textColor = isSelected ? .systemBlue : .systemGray
			return self
		}
		
		func set(isSelected: Bool) {
			titleLabel.textColor = isSelected ? .systemBlue : .systemGray
		}
		
		private func commonInit() {
			backgroundColor = .clear
			contentView.backgroundColor = .clear
			contentView.addSubview(titleLabel)
			titleLabel.pinEdgesToSuperView(leading: 0, trailing: 0, top: 0, bottom: 0)
			titleLabel.textAlignment = .center
			titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
		}
		
		class func widthFor(_ item: String, preferredHeight: CGFloat) -> CGFloat {
			let attr = NSAttributedString(string: item,
																		attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .bold)])
			return attr.size(preferredHeight: preferredHeight).width + 10
		}
	}
}
