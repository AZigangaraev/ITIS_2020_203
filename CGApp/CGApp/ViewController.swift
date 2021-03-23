//
//  ViewController.swift
//  CGApp
//
//  Created by Amir Zigangaraev on 16.03.2021.
//

import UIKit

class TriangleView: UIView {
    let levels: Int

    init(frame: CGRect, levels: Int = 5) {
        self.levels = levels

        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        self.levels = 5

        super.init(coder: coder)
        setup()
    }

    var bezierPath = UIBezierPath()

    func setup() {
        self.backgroundColor = .yellow
        var bottomPoints = [CGPoint]()

        for _ in 0..<levels {
            if bottomPoints.isEmpty {
                let HCenter = CGFloat(TriangleView.targetWidth) / (2.0)

                bottomPoints.append(
                    CGPoint(x: HCenter + triangleSide, y: triangleHeight))
                bottomPoints.append(
                    CGPoint(x: HCenter - triangleSide, y: triangleHeight))

                bezierPath.move(to: CGPoint(x: CGFloat(HCenter), y: CGFloat(0)))

                bezierPath.addLine(
                    to: bottomPoints[0])
                bezierPath.addLine(
                    to: bottomPoints[1])
            } else {
                var newPoints = [CGPoint]()
                bottomPoints.forEach {
                    newPoints.append(
                        contentsOf: self.drawEqualTriangle(in: bezierPath, start: $0)
                    )
                }
                bottomPoints = newPoints
            }

            bezierPath.close()
        }

        let cgPath = bezierPath.cgPath
        let layer = CAShapeLayer()
        layer.path = cgPath
        layer.fillColor = UIColor.blue.cgColor
        self.layer.addSublayer(layer)
    }

    private func drawEqualTriangle(in bezierPath: UIBezierPath, start: CGPoint) -> [CGPoint] {
        bezierPath.move(to: start)

        let bottomPoints = [
            CGPoint(x: start.x + triangleSide, y: start.y + triangleHeight),
            CGPoint(x: start.x - triangleSide, y: start.y + triangleHeight),
        ]

        bezierPath.addLine(
            to: bottomPoints[0])
        bezierPath.addLine(
            to: bottomPoints[1])

        return bottomPoints
    }

    private static let targetWidth: CGFloat = 200
    private static let targetHeight: CGFloat = 200

    private var triangleSide: CGFloat {
        TriangleView.targetWidth / CGFloat(levels) / 2
    }

    private var triangleHeight: CGFloat {
        (TriangleView.targetHeight / 2 * sqrt(3.0)) / CGFloat(levels)
    }

    public func suicide() {
        self.removeFromSuperview()
    }

    static func topCenter(frame: CGRect) -> CGRect {
        let XCorner = frame.width / 2.0 - targetWidth / 2.0
        let YCorner = frame.height / 4.0 - targetHeight / 2.0

        return CGRect(x: XCorner, y: YCorner, width: targetWidth, height: targetHeight)
    }

    static func bottomCenter(frame: CGRect) -> CGRect {
        let XCorner = frame.width / 2.0 - targetWidth / 2.0
        let YCorner = frame.height / 4.0 * 3.0 - targetHeight / 2.0

        return CGRect(x: XCorner, y: YCorner, width: targetWidth, height: targetHeight)
    }
}

class ViewController: UIViewController {

    private var topTriangleView: TriangleView?
    private var bottomTriangleView: TriangleView?

    private var customLevels = 8

    override func viewDidLoad() {
        super.viewDidLoad()

        let topFrame = TriangleView.topCenter(frame: self.view.frame)
        self.topTriangleView = TriangleView(frame: topFrame)

        let bottomFrame = TriangleView.bottomCenter(frame: self.view.frame)
        self.bottomTriangleView = TriangleView(frame: bottomFrame, levels: customLevels)

        let mySlider = UISlider(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        mySlider.minimumValue = 0
        mySlider.maximumValue = 16
        mySlider.addTarget(self, action: #selector(self.sliderValueDidChange(_:)), for: .valueChanged)
        mySlider.center = self.view.center

        if let topView = self.topTriangleView, let bottomView = self.bottomTriangleView {
            view.addSubview(topView)
            view.addSubview(bottomView)
            view.addSubview(mySlider)
        } else {
            fatalError("Failed to initiate views")
        }
    }

    @objc func sliderValueDidChange(_ sender: UISlider!) {
        let roundedStepValue = round(sender.value)
        sender.value = roundedStepValue

        bottomTriangleView?.suicide()

        let bottomFrame = TriangleView.bottomCenter(frame: self.view.frame)
        self.bottomTriangleView = TriangleView(frame: bottomFrame, levels: Int(roundedStepValue))
        view.addSubview(self.bottomTriangleView!)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}
