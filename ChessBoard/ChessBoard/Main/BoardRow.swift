//
//  BoardRow.swift
//  ChessBoard
//
//  Created by Roman Zverik on 06.12.2020.
//

import UIKit
import SnapKit

extension Appearance {
	var bordWhite: UIColor { .white}
	var bordBlack: UIColor { UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1) }
}

protocol LabelActionHandler: class {
	func actionHandler(cellName: String)
}

class BoardRow: UIStackView {
	//MARK: - private variable
	private let appearance = Appearance()
	private let dimensionCellBoard: CGFloat
	private let row: Int
	
	//MARK: - public variable
	weak var delegate: LabelActionHandler?
	
	//MARK: - inits
	init(row: Int, titleHorizontal: [String], dimensionCellBoard: CGFloat) {
		self.row = row
		self.dimensionCellBoard = dimensionCellBoard
		
		super.init(frame: CGRect.zero)
		self.axis = .horizontal
		
		self.addArrangedSubview(createCell(text: String(row)))
		createRowBoard(row: row, titleHorizontal: titleHorizontal)
		self.addArrangedSubview(createCell(text: String(row)))
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	//MARK: - private func
	private func createCell(text: String) -> UIView {
		let wrapView = UIView()
		
		let label = UILabel()
		label.text = text
		
		wrapView.addSubview(label)
		
		constraint(for: wrapView)
		label.snp.makeConstraints { make in
			make.center.equalToSuperview()
		}
		
		return wrapView
	}
	
	private func createCellBorder(isWhite: Bool, title: String) -> UIView {
		let wrapView = WrapViewButton(title: "\(title):\(row)")
		wrapView.layer.borderWidth = 0.5
		wrapView.backgroundColor = isWhite ? appearance.bordWhite: appearance.bordBlack
		
		wrapView.addTarget(self, action: #selector(actionWrapView), for: .touchUpInside)
		constraint(for: wrapView)
		
		return wrapView
	}
	
	private func constraint(for wrapView: UIView) {
		wrapView.snp.makeConstraints { [weak self] make in
			guard let self = self else { return }
			make.size.equalTo(CGSize(width: self.dimensionCellBoard, height: self.dimensionCellBoard))
		}
	}
	
	private func createRowBoard(row: Int, titleHorizontal: [String]) {
		var isWhite = false
		if row % 2 == 1 {
			isWhite = !isWhite
		}
		
		for i in 0...7 {
			isWhite = !isWhite
			self.addArrangedSubview(createCellBorder(isWhite: isWhite, title: titleHorizontal[i]))
		}
	}
	
	@objc private func actionWrapView(sender: WrapViewButton) {
		delegate?.actionHandler(cellName: sender.title)
	}
}
