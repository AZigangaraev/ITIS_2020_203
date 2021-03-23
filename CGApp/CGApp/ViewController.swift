//
//  ViewController.swift
//  CGApp
//
//  Created by Amir Zigangaraev on 16.03.2021.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var text_number: UITextField!
    override func viewDidLoad() {
        errorLabel.isHidden = true
        super.viewDidLoad()

    }
    
    let errorControl = ValidateViewController()
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animation()
    }
    @IBAction func buttonTap(_ sender: Any) { // Проверка введенного значения и переход на TriangleViewController при выполнении условий
        switch errorControl.checkTheField(stringNumber: text_number.text ?? "") {
        case .success(let number):
            errorLabel.alpha = 0
            let vc = TriangleViewController()
            vc.triforceNumber = number
            navigationController?.pushViewController(vc, animated: true)
        case .failure(let error):
            errorLabel.alpha = 1
            switch error {
            case .emptyField:
                errorLabel.isHidden = false
                errorLabel.text = "Пустое поле!"
            case .incorrectNumber:
                errorLabel.isHidden = false
                errorLabel.text = "Введено некорректное число!"
            case .notNumber:
                errorLabel.isHidden = false
                errorLabel.text = "Не является числом!"
    }
        }
    }
    
    func animation() { // Анимация цветов от Амира
        let basicAnimation = CABasicAnimation(keyPath: "backgroundColor")
        basicAnimation.fromValue = UIColor.green.cgColor
        basicAnimation.toValue = UIColor.yellow.cgColor
        basicAnimation.autoreverses = true
        basicAnimation.repeatCount = 50
        basicAnimation.duration = 2
        view.layer.add(basicAnimation, forKey: "backgroundColorChange")
    }
}

