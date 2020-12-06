//
//  MainViewController.swift
//  ChessBoard
//
//  Created by Roman Zverik on 06.12.2020.
//

import UIKit

class MainViewController: UIViewController {
	
	var customView: CustomMainView { return view as! CustomMainView }
	
	override func viewDidLoad() {
		super.viewDidLoad()
		print("viewDidLoad: MainViewController")
		
		view = CustomMainView(frame: UIScreen.main.bounds)
		customView.delegate = self

	}
}

extension MainViewController: LabelActionHandler {
	func actionHandler(cellName: String) {
		print(cellName)
	}
}
