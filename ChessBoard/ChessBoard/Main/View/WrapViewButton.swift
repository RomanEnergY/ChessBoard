//
//  WrapViewButton.swift
//  ChessBoard
//
//  Created by Roman Zverik on 07.12.2020.
//

import UIKit

struct CellBoard {
	let row: Int
	let rowTitle: String
	let column: Int
	let columnTitle: String
}

class WrapViewButton: UIButton {
	private(set) var cellBoard: CellBoard
	
	init(cellBoard: CellBoard) {
		self.cellBoard = cellBoard
		
		super.init(frame: CGRect.zero)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
