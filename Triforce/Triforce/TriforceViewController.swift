//
//  TriforceViewController.swift
//  Triforce
//
//  Created by Rishat on 19.03.2021.
//

import UIKit

class TriforceView: UIView {

    var level: Int = 0

    func setup() {
        backgroundColor = .white

        let bezierPath = UIBezierPath()
        bezierPath.usesEvenOddFillRule = true
        let size = frame.size.height
        let sizeTriangle = size / CGFloat(level)
        for i in 1...level {
            var x = (Double(size) / 2) - (Double(i - 1) * Double(sizeTriangle) / 2)
            for _ in 1...i {
                bezierPath.move(to: CGPoint(x: x, y: Double(i - 1) * Double(sizeTriangle)))
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

class TriforceViewController: UIViewController {

    var number: Int?
    let triforceView = TriforceView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange

        view.addSubview(triforceView)
        if let number = number {
            triforceView.level = number
        }
        triforceView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        triforceView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        triforceView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        triforceView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        triforceView.translatesAutoresizingMaskIntoConstraints = false
    }

    override func viewDidLayoutSubviews() {
        triforceView.setup()
    }
}
