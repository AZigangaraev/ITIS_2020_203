//
//  HomeScrennViewController.swift
//  NSTriforce
//
//  Created by Nikita Sosyuk on 20.03.2021.
//

import UIKit

class HomeScrennViewController: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
    }

    @IBAction func nextButtonAction(_ sender: Any) {
        guard let data = numberTextField.text else {
            return errorLabel.text = "Нет данных"
        }
        if let number = Int(data) {
            if number > 0 {
                let controllert = TriforceViewController()
                controllert.numberOfLevels = number
                navigationController?.pushViewController(controllert, animated: true)
                errorLabel.isHidden = true
            } else {
                errorLabel.isHidden = false
                return errorLabel.text = "Число должно быть положительным"
            }
        } else {
            errorLabel.isHidden = false
            return errorLabel.text = "Неправильное число"
        }
    }

}
