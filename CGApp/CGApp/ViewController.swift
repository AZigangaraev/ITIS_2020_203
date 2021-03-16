//
//  ViewController.swift
//  CGApp
//
//  Created by Amir Zigangaraev on 16.03.2021.
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

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let bubbleView = TailedBubbleView(frame: CGRect(x: 30, y: 80, width: 150, height: 80))
        view.addSubview(bubbleView)

        let reverseBubbleView = TailedBubbleView(frame: CGRect(x: 190, y: 180, width: 150, height: 80))
        view.addSubview(reverseBubbleView)
        reverseBubbleView.transform = CGAffineTransform(scaleX: -1, y: 1)

        let triangleView = TriangleView(frame: CGRect(x: 0, y: 280, width: 200, height: 200))
        view.addSubview(triangleView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        animation()
    }

    func animation() {
//        UIView.animate(withDuration: 5) {
//            self.view.backgroundColor = .green
//        }

//        UIView.animate(
//            withDuration: 5,
//            delay: 0,
//            options: [ .repeat, .autoreverse ],
//            animations: {
//                self.view.backgroundColor = .green
//            },
//            completion: nil
//        )

        let basicAnimation = CABasicAnimation(keyPath: "backgroundColor")
        basicAnimation.fromValue = UIColor.white.cgColor
        basicAnimation.toValue = UIColor.green.cgColor
        basicAnimation.autoreverses = true
        basicAnimation.repeatCount = 5
        basicAnimation.duration = 3
        view.layer.add(basicAnimation, forKey: "backgroundColorChange")
    }
}

