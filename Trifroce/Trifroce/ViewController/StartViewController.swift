//
//  ViewController.swift
//  Trifroce
//
//  Created by Булат Хабибуллин on 23.03.2021.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var linesTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLabel.alpha = 0
    }

    @IBAction func doneButton(_ sender: Any) {
        guard let numberOfLines = linesTextField.text else {
            return errorLabel.text = "Введите число"
        }
        if let number = Int(numberOfLines) {
            if number > 0 {
                let controller = MainViewController()
                controller.lines = number
                navigationController?.pushViewController(controller, animated: true)
                errorLabel.alpha = 0
            } else {
                errorLabel.alpha = 1
                return errorLabel.text = "Введите положительное число"
            }
        } else {
            errorLabel.alpha = 1
            return errorLabel.text = "Неверное значение"
        }
    }
}

