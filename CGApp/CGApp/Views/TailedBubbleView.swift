//
//  TailedBubbleView.swift
//  CGApp
//
//  Created by Олег Романов on 3/20/21.
//

import UIKit

class TailedBubbleView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }

    private func setup() {
        backgroundColor = .clear
    }

    var radius: CGFloat = 16 {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }

        // Drawing bubble
        context.move(to: CGPoint(x: 0, y: rect.maxY))
        context.addArc(
            center: CGPoint(x: 0, y: rect.maxY - radius),
            radius: radius,
            startAngle: .pi / 2,
            endAngle: 0,
            clockwise: true
        )
        context.addLine(to: CGPoint(x: radius, y: radius))
        context.addArc(
            center: CGPoint(x: 2 * radius, y: radius),
            radius: radius,
            startAngle: .pi,
            endAngle: -.pi / 2,
            clockwise: false
        )
        context.addLine(to: CGPoint(x: rect.maxX - radius, y: 0))
        context.addArc(
            center: CGPoint(x: rect.maxX - radius, y: radius),
            radius: radius,
            startAngle: -.pi / 2,
            endAngle: 0,
            clockwise: false
        )
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - radius))
        context.addArc(
            center: CGPoint(x: rect.maxX - radius, y: rect.maxY - radius),
            radius: radius,
            startAngle: 0,
            endAngle: .pi / 2,
            clockwise: false
        )
        context.closePath()

        // Rendering
        context.setFillColor(UIColor.lightGray.cgColor)
        context.closePath()
        context.fillPath()
    }
}
