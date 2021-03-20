//
//  TriforceView.swift
//  CGApp
//
//  Created by Олег Романов on 3/20/21.
//

import UIKit

class TriforceView: UIView {

    private var count: Int?

    init(frame: CGRect, count: Int) {
        self.count = count
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        backgroundColor = .cyan
        let bezierPath = UIBezierPath()
        bezierPath.usesEvenOddFillRule = true

        let valueX = 20
        let valueY = 20
        var i = 1
        var j = 0
        var k = 0

        while i <= count ?? 5 {
            k = j * valueX / 2
            while j < count ?? 5 {
                bezierPath.move(to: CGPoint(x: j * valueX - k, y: 400 - i * valueY))
                bezierPath.addLine(to: CGPoint(x: 10 + j * valueX - k, y: 380 - i * valueY))
                bezierPath.addLine(to: CGPoint(x: 20 + j * valueX - k, y: 400 - i * valueY))
                bezierPath.close()
                j += 1
            }
            i += 1
            j = i - 1
        }

        let cgPath = bezierPath.cgPath
        let layer = CAShapeLayer()
        layer.path = cgPath
        layer.fillColor = UIColor.blue.cgColor
        self.layer.addSublayer(layer)
    }
}
