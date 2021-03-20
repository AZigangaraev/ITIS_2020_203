//
//  CustomVIew.swift
//  CGContext
//
//  Created by Svetlana Safonova on 20.03.2021.
//

import UIKit

class CustomVIew: UIView {


    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        
    }

    override func draw(_ rect: CGRect) {

        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.saveGState()

        let triangleLayer = CAShapeLayer()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 40))
        path.addLine(to: CGPoint(x: 40, y: 40))
        path.addLine(to: CGPoint(x: 20, y: 0))
        path.close()
        path.fill()
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(1.5)
        context.restoreGState()

        triangleLayer.path = path.cgPath
        self.layer.mask = triangleLayer.mask


    }
}
