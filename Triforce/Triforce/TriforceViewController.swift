//
//  TriforceViewController.swift
//  Triforce
//
//  Created by Никита Ляпустин on 19.03.2021.
//

import UIKit

class TriforceViewController: UIViewController {

	var countOfLines: Int?

	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
	}

	private func setup() {
		view.backgroundColor = .white
		let triforceContainer = TriforceContainer()
		triforceContainer.countOfLines = countOfLines
		triforceContainer.drawTriforce()
		view.addSubview(triforceContainer)
		triforceContainer.backgroundColor = .systemGray6
		triforceContainer.widthAnchor.constraint(equalToConstant: 200).isActive = true
		triforceContainer.heightAnchor.constraint(equalToConstant: 200).isActive = true
		triforceContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		triforceContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		triforceContainer.translatesAutoresizingMaskIntoConstraints = false
	}

	class TriforceContainer: UIView {
		var countOfLines: Int?

		func drawTriforce() {
			guard let countOfLines = countOfLines else { return }

			let triangleHeight = 200 / countOfLines
			let triangleWidth = 200 / countOfLines

			let bezierPath = UIBezierPath()

			for i in 1...countOfLines {
				let firstTriangleStart: CGPoint
				if i % 2 == 0 {
					firstTriangleStart = CGPoint(x: 100 - triangleWidth * (i/2) + triangleWidth/2, y: triangleHeight * (i-1))
				} else {
					firstTriangleStart = CGPoint(x: 100 - triangleWidth * (i/2), y: triangleHeight * (i-1))
				}
				for j in 1...i {
					bezierPath.usesEvenOddFillRule = true

					let triangleStart = CGPoint(x: Int(firstTriangleStart.x) + triangleWidth * (j - 1),
												y: triangleHeight*(i-1))
					bezierPath.move(to: triangleStart)

					bezierPath.addLine(to: CGPoint(x: triangleStart.x - CGFloat(triangleWidth / 2),
												   y: triangleStart.y + CGFloat(triangleHeight)))
					bezierPath.addLine(to: CGPoint(x: triangleStart.x + CGFloat(triangleWidth / 2),
												   y: triangleStart.y + CGFloat(triangleHeight)))

					bezierPath.close()
				}
			}

			let cgPath = bezierPath.cgPath
			let layer = CAShapeLayer()
			layer.path = cgPath
			layer.fillColor = UIColor.blue.cgColor
			self.layer.addSublayer(layer)
		}

	}
}
