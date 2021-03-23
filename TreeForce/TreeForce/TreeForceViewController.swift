//
//  TreeForceViewController.swift
//  TreeForce
//
//  Created by Albert Ahmadiev on 19.03.2021.
//

import UIKit

class TreeForceViewController: UIViewController {

	var treeForceNumber = 0
	var treeForceContainer = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		setup()
    }

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()

		setTreeForce()
	}

	func setup() {
		view.backgroundColor = .white
		view.addSubview(treeForceContainer)
		treeForceContainer.translatesAutoresizingMaskIntoConstraints = false
		treeForceContainer.widthAnchor.constraint(equalToConstant: 200).isActive = true
		treeForceContainer.heightAnchor.constraint(equalToConstant: 200).isActive = true
		treeForceContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		treeForceContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		treeForceContainer.backgroundColor = .white
	}

	func setTreeForce(){
		let bezierPath = UIBezierPath()
		bezierPath.usesEvenOddFillRule = true
		let size = treeForceContainer.frame.size.height
		let sizeTriangle = size / CGFloat(treeForceNumber)
//		let sizeTriangle = 2 * heightTriangle * tan(Double.pi/6)
		for i in 1...treeForceNumber {
			var x = ((Double(size) / 2) - (Double(i - 1) * Double(sizeTriangle) / 2))
			for _ in 1...i {
				bezierPath.move(to: CGPoint(x: x, y: Double((i - 1)) * Double(sizeTriangle)))
				bezierPath.addLine(to: CGPoint(x: x - (Double(sizeTriangle) / 2), y: Double(i) * Double(sizeTriangle)))
				bezierPath.addLine(to: CGPoint(x: x + (Double(sizeTriangle) / 2), y: Double(i) * Double(sizeTriangle)))
				bezierPath.close()
				x = x + Double(sizeTriangle)

//				let cgPath = bezierPath.cgPath
//				let layer = CAShapeLayer()
//				layer.path = cgPath
//				layer.fillColor = UIColor.blue.cgColor
//				self.treeForceContainer.layer.addSublayer(layer)
			}
		}
		let cgPath = bezierPath.cgPath
		let layer = CAShapeLayer()
		layer.path = cgPath
		layer.fillColor = UIColor.blue.cgColor
		self.treeForceContainer.layer.addSublayer(layer)
	}



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
