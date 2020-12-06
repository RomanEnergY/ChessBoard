//
//  BoardTitle.swift
//  ChessBoard
//
//  Created by Roman Zverik on 06.12.2020.
//

import UIKit
import SnapKit

class BoardTitle: UIStackView {
	private let dimensionCellBoard: CGFloat
	
	init(titleHorizontal: [String], dimensionCellBoard: CGFloat) {
		self.dimensionCellBoard = dimensionCellBoard
		
		super.init(frame: CGRect.zero)
		self.axis = .horizontal
		
		self.addArrangedSubview(createCell(text: ""))
		titleHorizontal.forEach { [weak self] title in
			self?.addArrangedSubview(createCell(text: title))
		}
		self.addArrangedSubview(createCell(text: ""))
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func createCell(text: String) -> UIView {
		let wrapView = UIView()
		let label = UILabel()
		label.text = text
		
		wrapView.addSubview(label)
		
		wrapView.snp.makeConstraints { [weak self] make in
			guard let self = self else { return }
			make.size.equalTo(CGSize(width: self.dimensionCellBoard, height: self.dimensionCellBoard))
		}
		
		label.snp.makeConstraints { make in
			make.center.equalToSuperview()
		}
		
		return wrapView
	}
}
