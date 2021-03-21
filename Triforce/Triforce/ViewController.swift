//
//  ViewController.swift
//  Triforce
//
//  Created by Ruslan Khanov on 20.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var triforceView: UIView?
    
    let levelTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter num of levels"
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let drawButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Draw", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.addTarget(self, action: #selector(drawTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(levelTextField)
        view.addSubview(drawButton)
        
        NSLayoutConstraint.activate([
            levelTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            levelTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            levelTextField.heightAnchor.constraint(equalToConstant: 50.0),
            levelTextField.widthAnchor.constraint(equalToConstant: 200.0),
            drawButton.topAnchor.constraint(equalTo: levelTextField.bottomAnchor, constant: 50),
            drawButton.heightAnchor.constraint(equalToConstant: 50.0),
            drawButton.widthAnchor.constraint(equalToConstant: 200.0),
            drawButton.centerXAnchor.constraint(equalTo: levelTextField.centerXAnchor)
        ])
    }
    
    private func drawTriforce(level: Int, for view: UIView, withSize frameSize: Double) {
        let size = frameSize / Double(level)
        let minSpaceX = size / 2
        
        for i in 1...level {
            for j in 0...i - 1 {
                let spaceX = minSpaceX * Double((level - i)) + size * Double(j)
                let spaceY = size * Double(i - 1)
                let triangleView = TriangleView(frame: CGRect(x: spaceX, y: spaceY, width: size, height: size))
                view.addSubview(triangleView)
            }
        }
    }
    
    @objc private func drawTapped() {
        guard let levelsStr = levelTextField.text else {
            return
        }
        
        guard let levels = Int(levelsStr) else {
            return
        }
        
        if let triforceView = triforceView {
            triforceView.removeFromSuperview()
        }
        
        triforceView = UIView(frame: CGRect(x: view.bounds.width / 2 - 100, y: view.bounds.height / 2 + 100, width: 200, height: 200))
            
        drawTriforce(level: levels, for: triforceView!, withSize: Double(triforceView!.bounds.width))
        view.addSubview(triforceView!)
    }
}



