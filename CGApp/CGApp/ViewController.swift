//
//  ViewController.swift
//  CGApp
//
//  Created by Amir Zigangaraev on 16.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
// Да, лучше код подобный убирать, я помню, но здесь оставил себе на будущее...
//        let bubbleView = TailedBubbleView(frame: CGRect(x: 30, y: 80, width: 150, height: 80))
//        view.addSubview(bubbleView)
//
//        let reverseBubbleView = TailedBubbleView(frame: CGRect(x: 190, y: 180, width: 150, height: 80))
//        view.addSubview(reverseBubbleView)
//        reverseBubbleView.transform = CGAffineTransform(scaleX: -1, y: 1)
//
//        let triangleView = TriangleView(frame: CGRect(x: 0, y: 280, width: 200, height: 200))
//        view.addSubview(triangleView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animation()
    }

    func animation() {
        let basicAnimation = CABasicAnimation(keyPath: "backgroundColor")
        basicAnimation.fromValue = UIColor.white.cgColor
        basicAnimation.toValue = UIColor.green.cgColor
        basicAnimation.autoreverses = true
        basicAnimation.repeatCount = 5
        basicAnimation.duration = 3
        view.layer.add(basicAnimation, forKey: "backgroundColorChange")
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        guard
            let text = textField.text,
            let number = Int(text)
        else {
            return
        }

        let triforceView = TriforceView(frame: CGRect(x: 0, y: 150, width: UIScreen.main.bounds.width, height: 650), count: number)
        view.addSubview(triforceView)
    }
}

