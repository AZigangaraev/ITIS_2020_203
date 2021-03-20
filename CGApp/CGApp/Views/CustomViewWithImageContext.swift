//
//  CustomViewWithImageContext.swift
//  CGApp
//
//  Created by Олег Романов on 3/20/21.
//

import UIKit

class CustomViewWithImageContext: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }

    private func setup() {
        backgroundColor = .white

        UIGraphicsBeginImageContextWithOptions(
            CGSize(width: 200, height: 200),
            false,
            2
        )

        guard let context = UIGraphicsGetCurrentContext() else { return }

        context.move(to: CGPoint(x: 10, y: 10))
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(5)
        context.setFillColor(UIColor.yellow.cgColor)
        context.addLine(to: CGPoint(x: 190, y: 190))
        context.addLine(to: CGPoint(x: 10, y: 190))
        context.closePath()
        context.strokePath()
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return }
        addSubview(UIImageView(image: image))
        UIGraphicsEndImageContext()
    }
}
