//
//  CustomView.swift
//  CGApp
//
//  Created by Олег Романов on 3/20/21.
//

import UIKit

class CustomView: UIView {
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
    }

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }

        // (50;50), (100;100), (50;100)
        context.move(to: CGPoint(x: 50, y: 50))
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(5)
        context.addLine(to: CGPoint(x: 100, y: 100))
        context.addLine(to: CGPoint(x: 50, y: 100))
        context.closePath()
        context.strokePath()
    }
}
