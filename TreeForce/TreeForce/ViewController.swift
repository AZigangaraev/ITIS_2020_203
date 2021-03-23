//
//  ViewController.swift
//  TreeForce
//
//  Created by Albert Ahmadiev on 19.03.2021.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var errorLabel: UILabel!

	let viewModel = ViewControllerModel()

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		errorLabel.alpha = 0
	}


	@IBAction func makeItTap(_ sender: Any) {
		switch viewModel.check(stringNumber: textField.text ?? "") {
		case .success(let number):
			errorLabel.alpha = 0
			let treeForceVC = TreeForceViewController()
			treeForceVC.treeForceNumber = number
			navigationController?.pushViewController(treeForceVC, animated: true)
		case .failure(let error):
			errorLabel.alpha = 1
			switch error {
			case .emptyField:
				errorLabel.text = "Empty field"
			case .notCorrectNumber:
				errorLabel.text = "Not correct number"
			case .notNumber:
				errorLabel.text = "It's not a number"
			}
		}
	}


}

