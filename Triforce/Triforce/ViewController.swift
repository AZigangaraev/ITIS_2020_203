//
//  ViewController.swift
//  Triforce
//
//  Created by Никита Ляпустин on 19.03.2021.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var numberOfLinesTextField: UITextField!
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func acceptButtonTapped(_ sender: Any) {
		guard let numberOfLines = Int(numberOfLinesTextField.text ?? "0"), numberOfLines >= 0 else {
			numberOfLinesTextField.text = ""
			return
		}
		let triforceViewController = TriforceViewController()
		triforceViewController.countOfLines = numberOfLines
		present(triforceViewController, animated: true, completion: nil)
	}
}

