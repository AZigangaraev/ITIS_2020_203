//
//  TriangleViewController.swift
//  EvelinaCG
//
//  Created by Эвелина on 23.03.2021.
//
import UIKit
class TriangleViewController: UIViewController {
    @IBOutlet weak var triangle_view: UIView!
    var triforceNumber = 0
    var triforceContainer = UIView() // Вьюшка
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        triforceFigure()
    }
    func setup() { // Параметры вьюшки
        view.backgroundColor = .yellow
        view.addSubview(triforceContainer)
        triforceContainer.translatesAutoresizingMaskIntoConstraints = false
        triforceContainer.widthAnchor.constraint(equalToConstant: 200).isActive = true
        triforceContainer.heightAnchor.constraint(equalToConstant: 200).isActive = true
        triforceContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        triforceContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        triforceContainer.backgroundColor = .white
    }
    func triforceFigure() {
         let bezierPath = UIBezierPath()
         bezierPath.usesEvenOddFillRule = true
// Уменьшаем размер треугольников чтобы вместились во вьюшку и отрисовываем трифорс ->
         let sizeOfFigure = triforceContainer.frame.size.height
         let sizeOfTriangle = sizeOfFigure/CGFloat(triforceNumber)
    
    for i in 1...triforceNumber {
         var x = ((Double(sizeOfFigure) / 2) - (Double(i - 1) * Double(sizeOfTriangle) / 2))
         for _ in 1...i {
            bezierPath.move(to: CGPoint(x: x, y: Double((i - 1)) * Double(sizeOfTriangle)))
            bezierPath.addLine(to: CGPoint(x: x - Double(sizeOfTriangle) / 2, y: Double(i) * Double(sizeOfTriangle)))
            bezierPath.addLine(to: CGPoint(x: x + Double(sizeOfTriangle) / 2, y: Double(i) * Double(sizeOfTriangle)))
            bezierPath.close()
            x = x + Double(sizeOfTriangle)
        }
    } // <-
    // Делаем трифорс цветным
         let cgPath = bezierPath.cgPath
         let layer = CAShapeLayer()
         layer.path = cgPath
         layer.fillColor = UIColor.black.cgColor
         self.triforceContainer.layer.addSublayer(layer)
    }
    
    func animation() { // Анимация цветов от Амира
        let basicAnimation = CABasicAnimation(keyPath: "backgroundColor")
        basicAnimation.fromValue = UIColor.green.cgColor
        basicAnimation.toValue = UIColor.yellow.cgColor
        basicAnimation.autoreverses = true
        basicAnimation.repeatCount = 50
        basicAnimation.duration = 2
        view.layer.add(basicAnimation, forKey: "backgroundColorChange")
    }
}
       

