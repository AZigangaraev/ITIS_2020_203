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
        let size = Double(frame.size.height) / Double(level)
        
        for i in 1...level {
            var x = ((Double(frame.size.height) / 2) - Double(i - 1) * size / 2)
            for _ in 1...i {
                bezierPath.usesEvenOddFillRule = true
                bezierPath.move(to: CGPoint(x: x, y: Double((i - 1)) * size))
                bezierPath.addLine(to: CGPoint(x: x - (size / 2), y: Double(i) * size))
                bezierPath.addLine(to: CGPoint(x: x + (size / 2), y: Double(i) * size))
                bezierPath.close()
                x = x + size
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
