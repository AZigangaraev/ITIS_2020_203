//
//  ViewController.swift
//  Triforce
//
//  Created by Rishat on 19.03.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        numberTextField.delegate = self
    }

    func validateFields() -> String? {
        if numberTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields"
        }
        return nil
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
        self.errorLabel.numberOfLines = 0
    }

    @IBAction func drawAction(_ sender: Any) {
        let error = validateFields()

        if error != nil {
            showError(error!)
        } else {
            guard let level = Int(numberTextField.text!) else { return }

            if level <= 1000 && level > 0 {
                let destination = TriforceViewController()
                destination.number = level 
                navigationController?.pushViewController(destination, animated: true)
            } else {
                self.showError("Please enter a number <= 1000 and > 0")
            }
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == numberTextField {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
}

