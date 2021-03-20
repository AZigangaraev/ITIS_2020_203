//
//  TriangleView.swift
//  CGApp
//
//  Created by Олег Романов on 3/20/21.
//

import UIKit

class TriangleView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }

    private func setup() {
        backgroundColor = .yellow

        let bezierPath = UIBezierPath()
        bezierPath.usesEvenOddFillRule = true
        // (50;50), (100;100), (50;100)
        bezierPath.move(to: CGPoint(x: 50, y: 50))
        bezierPath.addLine(to: CGPoint(x: 100, y: 100))
        bezierPath.addLine(to: CGPoint(x: 50, y: 100))
        bezierPath.close()

        let circlePath = UIBezierPath(ovalIn: CGRect(x: 50, y: 75, width: 25, height: 25))
        bezierPath.append(circlePath.reversing())

        let cgPath = bezierPath.cgPath
        let layer = CAShapeLayer()
        layer.path = cgPath
        layer.fillColor = UIColor.blue.cgColor
        self.layer.addSublayer(layer)
    }
}
