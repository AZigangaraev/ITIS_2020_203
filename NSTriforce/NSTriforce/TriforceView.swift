//
//  Triforce.swift
//  NSTriforce
//
//  Created by Nikita Sosyuk on 19.03.2021.
//

import UIKit

class TriforceView: UIView {
    func drawNodes(count: Int) {
        let frameSize = frame.size
        let width = Double(frameSize.width) / Double(count)
        var xPosition: Double = 0
        var yPosition = Double(frameSize.height)
        let bezierPath = UIBezierPath()
        for i in (0...count).reversed() {
            for _ in 0..<i {
                bezierPath.usesEvenOddFillRule = true
                bezierPath.move(to: CGPoint(x: xPosition, y: yPosition))
                xPosition += width / 2
                bezierPath.addLine(to: CGPoint(x: xPosition, y: yPosition - width))
                xPosition += width / 2
                bezierPath.addLine(to: CGPoint(x: xPosition, y: yPosition))
                bezierPath.close()
            }
            yPosition -= width
            xPosition = (width / 2) * Double(count - i + 1)
        }
        let cgPath = bezierPath.cgPath
        let layer = CAShapeLayer()
        layer.path = cgPath
        layer.fillColor = UIColor.blue.cgColor
        self.layer.addSublayer(layer)
    }
}
