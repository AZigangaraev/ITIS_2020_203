//
//  ViewController.swift
//  CGContext
//
//  Created by Svetlana Safonova on 20.03.2021.
//

import UIKit


class ViewController: UIViewController {

    var firstTriangle: CustomVIew!

    var mainView: UIView!

    var levels = 1

    @IBOutlet weak var layersTextField: UITextField!

    @IBOutlet weak var drawButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        mainView = UIView(frame: CGRect(x: 0, y: 250, width: view.bounds.width, height: view.bounds.width))

    }

    @IBAction func drawAction(_ sender: Any) {
        if layersTextField.text != nil {
            mainView.removeFromSuperview()
            mainView = UIView(frame: CGRect(x: 0, y: 250, width: view.bounds.width, height: view.bounds.width))
            view.addSubview(mainView)
            mainView.backgroundColor = UIColor.clear
            firstTriangle = CustomVIew(frame: CGRect(x: view.bounds.width/2 - 20, y: 0, width: 40, height: 40))
            mainView.addSubview(firstTriangle)
            levels = Int(layersTextField.text!)!
            drawTriangle(level: levels)
        }
    }

    func drawTriangle(level: Int) {

        if level == 1 {
            firstTriangle = CustomVIew(frame: CGRect(x: view.bounds.width/2 - 20, y: 0, width: 40, height: 40))
            mainView.addSubview(firstTriangle)
        } else {
        for i in 1...level-1 {
            let newView = CustomVIew(frame: CGRect(x: firstTriangle.frame.minX - CGFloat(i * 20), y: firstTriangle.frame.minY + CGFloat(i * 40), width: 40, height: 40))
            mainView.addSubview(newView)
            var count = i
            var maxX = newView.frame.maxX
            var minY = newView.frame.minY
            while count != 0 {
                let nextView = CustomVIew(frame: CGRect(x: maxX, y: minY, width: 40, height: 40))
                maxX = nextView.frame.maxX
                minY = nextView.frame.minY
                mainView.addSubview(nextView)
                count -= 1

                }
            }
        }
    }


}

