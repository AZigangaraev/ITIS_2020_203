//
//  MainViewController.swift
//  Trifroce
//
//  Created by Булат Хабибуллин on 23.03.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    var lines = 0
    
    let triforceView = CustomView(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 100, y: UIScreen.main.bounds.height / 2 - 100, width: 200, height: 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(triforceView)
        triforceView.drawTriforce(raw: lines)
    }
}

class CustomView: UIView {
    
    func drawTriforce(raw: Int) {
        let bezierPath = UIBezierPath()
        bezierPath.usesEvenOddFillRule = true
        let size = frame.size.height
        let sizeTriangle = size / CGFloat(raw)
        for i in 1...raw {
            var x = (Double(size) / 2) - (Double(i - 1) * Double(sizeTriangle) / 2)
            for _ in 1...i {
                bezierPath.move(to: CGPoint(x: x, y: Double((i - 1)) * Double(sizeTriangle)))
                bezierPath.addLine(to: CGPoint(x: x - (Double(sizeTriangle) / 2), y: Double(i) * Double(sizeTriangle)))
                bezierPath.addLine(to: CGPoint(x: x + (Double(sizeTriangle) / 2), y: Double(i) * Double(sizeTriangle)))
                bezierPath.close()
                x = x + Double(sizeTriangle)
            }
        }
        let cgPath = bezierPath.cgPath
        let layer = CAShapeLayer()
        layer.path = cgPath
        layer.fillColor = UIColor.black.cgColor
        self.layer.addSublayer(layer)
    }
}
