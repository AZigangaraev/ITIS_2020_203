//
//  HomeViewController.swift
//  CGApp
//
//  Created by Рустем on 22.03.2021.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {

    class TriangleView: UIView {

        override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = .clear
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func draw(_ rect: CGRect) {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: rect.width/2, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.close()
            UIColor.green.set()
            path.fill()
        }

    }

     private var bigView: UIView!

    private var textField: UITextField!

    func setLevel() {
        if let levels = Int(textField.text ?? "5") {
            if levels > 0 {

            if let triangleView = self.bigView {
                triangleView.removeFromSuperview()
            }
                setBigView()

            pasteTriangles(level: levels, bigView: bigView, bigViewSize: bigView!.bounds.width)
            view.addSubview(bigView!)
            }
        }

    }

    func setBigView() {
        if view.frame.width <= 300 {
            let wi = view.frame.width
            bigView = UIView(frame: CGRect(x: view.bounds.width / 2 - 150, y: view.bounds.height / 2 + 150 - 20, width: wi, height: wi))
            bigView.backgroundColor = .yellow
            bigView.center = self.view.center
        } else {

            bigView = UIView(frame: CGRect(x: view.bounds.width / 2 - 150, y: view.bounds.height / 2 + 150 - 20, width: 300, height: 300))
            bigView.backgroundColor = .yellow
            bigView.center = self.view.center
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setBigView()

        textField = UITextField()
        textField.frame = CGRect(x: 20, y: bigView.frame.minY - 60, width: view.frame.width - 40, height: 40)
        textField.delegate = self
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 6
        textField.layer.masksToBounds = true
        view.addSubview(textField)
    }

    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        setLevel()
        return true
    }

    private func pasteTriangles(level: Int, bigView: UIView, bigViewSize: CGFloat) {
        let size: Double = Double(bigViewSize) / Double((level * 2))

        for i in 0...level-1 {
            for j in 0...i {
                let spaceX =  (size * 2) * Double(j)
                let whiteX = Double(size) * Double((level - i - 1)) + spaceX
                let whiteY: Double = size * 2 * Double(i)
                let triangleView = TriangleView(frame: CGRect(x: whiteX, y: whiteY, width: size * 2, height: size * 2))
                bigView.addSubview(triangleView)
            }
        }
    }

}
