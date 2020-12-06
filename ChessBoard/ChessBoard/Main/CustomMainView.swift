//
//  CustomMainView.swift
//  ChessBoard
//
//  Created by Roman Zverik on 06.12.2020.
//

import UIKit
import SnapKit

public struct Appearance {
	var dimensionCellBoard: CGFloat { CGFloat(30) }
	var titleHorizontal: [String] { ["A", "B", "C", "D", "E", "F", "G", "H"] }
	var titleVertical: [Int] { [1, 2, 3, 4, 5, 6, 7, 8] }
}

class CustomMainView: UIView {
	
	//MARK: - private variables
	private let appearance = Appearance()
	private var boardStackView: UIStackView!
	weak var delegate: LabelActionHandler?

	//MARK: - inits
	public override init(frame: CGRect = CGRect.zero) {
		super.init(frame: frame)
		
		configure()
		addSubviews()
		makeConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	//MARK: - Public func
	func configure() {
		backgroundColor = .white
		
		boardStackView = UIStackView()
		boardStackView.axis = .vertical
	}
	
	func addSubviews() {
		self.addSubview(boardStackView)
		boardStackView.addArrangedSubview(BoardTitle(titleHorizontal: appearance.titleHorizontal, dimensionCellBoard: appearance.dimensionCellBoard))
		for i in 0...7 {
			let boardRow = BoardRow(row: appearance.titleVertical[i], titleHorizontal: appearance.titleHorizontal, dimensionCellBoard: appearance.dimensionCellBoard)
			boardRow.delegate = self
			boardStackView.addArrangedSubview(boardRow)
		}
		boardStackView.addArrangedSubview(BoardTitle(titleHorizontal: appearance.titleHorizontal, dimensionCellBoard: appearance.dimensionCellBoard))

	}
	
	func makeConstraints() {
		boardStackView.snp.makeConstraints { make in
			make.center.equalToSuperview()
		}
	}
}

//MARK: - extension LabelActionHandler
extension CustomMainView: LabelActionHandler {
	func actionHandler(cellName: String) {
		delegate?.actionHandler(cellName: cellName)
	}
}
