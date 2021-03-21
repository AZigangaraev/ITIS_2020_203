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

        mainView = UIView(frame: CGRect(x: 0, y: 250, width: 200, height: 200))

    }

    @IBAction func drawAction(_ sender: Any) {
        if layersTextField.text != nil {
            mainView.removeFromSuperview()
            mainView = UIView(frame: CGRect(x: view.bounds.width / 2 - 100, y: view.bounds.height / 2 - 100, width: 200, height: 200))
            mainView.backgroundColor = .init(red: 255.0/255.0, green: 254.0/255.0, blue: 194.0/255.0, alpha: 1)
            mainView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
            mainView.layer.borderWidth = 1
            view.addSubview(mainView)
            levels = Int(layersTextField.text!)!
            firstTriangle = CustomVIew(frame: CGRect(
                                        x: 0 + (mainView.bounds.width / 2 - mainView.bounds.width / CGFloat((levels) * 2)),
                                        y: 0,
                                        width: mainView.bounds.width/CGFloat(levels),
                                        height: mainView.bounds.height/CGFloat(levels)))
            mainView.addSubview(firstTriangle)
            drawTriangle(level: levels)
        }
    }

    func drawTriangle(level: Int) {
        guard level != 1 else { return }

        for i in 1...level-1 {
            let newView = CustomVIew(frame: CGRect(
                                        x: firstTriangle.frame.minX - CGFloat(CGFloat(i) * mainView.bounds.width/CGFloat(levels)/2),
                                        y: firstTriangle.frame.minY + CGFloat(CGFloat(i) * mainView.bounds.height/CGFloat(levels)),
                                        width: mainView.bounds.width/CGFloat(levels),
                                        height: mainView.bounds.height/CGFloat(levels)))
            mainView.addSubview(newView)
            var count = i
            var maxX = newView.frame.maxX
            var minY = newView.frame.minY
            while count != 0 {
                let nextView = CustomVIew(frame: CGRect(
                                            x: maxX,
                                            y: minY,
                                            width: mainView.bounds.width/CGFloat(levels),
                                            height: mainView.bounds.height/CGFloat(levels)))
                maxX = nextView.frame.maxX
                minY = nextView.frame.minY
                mainView.addSubview(nextView)
                count -= 1
            }
        }
    }
}
