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

  
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

   
    }

    private func setup() {
        backgroundColor = .yellow
    }

    override func draw(_ rect: CGRect) {

    }
}

class CustomViewWithImageContext: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

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

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

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
    var count = 5
    override init(frame: CGRect) {
        super.init(frame: frame)

//        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

//        setup()
    }

     func setup(with count: Int) {
        let path = UIBezierPath()
        let x = 20
        let y = 20
        var t = 0
        var j = 0
        var k = 0
        var i = 1
        // first version
//        var z = 0
//        var l = 0
//        while t < count {
//            path.move(to: CGPoint(x: x * t, y: 400 - y))
//            path.addLine(to: CGPoint(x: 10 + x * t, y: 380 - y))
//            path.addLine(to: CGPoint(x: 20 + x * t, y: 400 - y))
//            path.close()
//            t += 1
//        }
//
//        while j < count - 1 {
//            path.move(to: CGPoint(x: 10 + x * j, y: 380 - y))
//            path.addLine(to: CGPoint(x: 20 + x * j, y: 360 - y))
//            path.addLine(to: CGPoint(x: 30 + x * j, y: 380 - y))
//            path.close()
//            j += 1
//        }
//
//        while k < count - 2 {
//            path.move(to: CGPoint(x: 20 + x * k, y: 360 - y))
//            path.addLine(to: CGPoint(x: 30 + x * k, y: 340 - y))
//            path.addLine(to: CGPoint(x: 40 + x * k, y: 360 - y))
//            path.close()
//            k += 1
//        }
//
//        while z < count - 3 {
//            path.move(to: CGPoint(x: 30 + x * z, y: 340 - y))
//            path.addLine(to: CGPoint(x: 40 + x * z, y: 320 - y))
//            path.addLine(to: CGPoint(x: 50 + x * z, y: 340 - y))
//            path.close()
//            z += 1
//        }
//
//        while l < count - 4 {
//            path.move(to: CGPoint(x: 40 + x * l, y: 320 - y))
//            path.addLine(to: CGPoint(x: 50 + x * l, y: 300 - y))
//            path.addLine(to: CGPoint(x: 60 + x * l, y: 320 - y))
//            path.close()
//            l += 1
//        }
//
//
//
//
    while i <= count  {
        k = j * x / 2
        while j < count {
            path.move(to: CGPoint(x: j * x - k, y: 400 - i * y))
            path.addLine(to: CGPoint(x: 10 + j * x - k, y: 380 - i * y))
            path.addLine(to: CGPoint(x: 20 + j * x - k, y: 400 - i * y))
            path.close()
            j += 1
        }
        i += 1
        j = i - 1
      }
        let cgPath = path.cgPath
        let layer = CAShapeLayer()
        layer.path = cgPath
        layer.fillColor = UIColor.black.cgColor
        self.layer.addSublayer(layer)
    }
}

 

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    let triangle = TriangleView()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func drawTriangle(_ sender: Any) {
        if let count = Int(textField.text ?? "5") {
            triangle.setup(with: count)
            view.addSubview(triangle)
        }
    }
}

