//
//  WrapViewButton.swift
//  ChessBoard
//
//  Created by Roman Zverik on 07.12.2020.
//

import UIKit

class WrapViewButton: UIButton {
	private(set) var title: String
	
	init(title: String) {
		self.title = title
		
		super.init(frame: CGRect.zero)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
