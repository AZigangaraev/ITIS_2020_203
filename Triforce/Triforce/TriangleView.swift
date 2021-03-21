//
//  TriangleView.swift
//  Triforce
//
//  Created by Ruslan Khanov on 21.03.2021.
//

import UIKit

class TriangleView: UIView {

    private var color: UIColor = .black
    private var firstPointX: CGFloat = 0.5
    private var firstPointY: CGFloat = 0
    private var secondPointX: CGFloat = 0
    private var secondPointY: CGFloat = 1
    private var thirdPointX: CGFloat = 1
    private var thirdPointY: CGFloat = 1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        aPath.move(to: CGPoint(x: self.firstPointX * rect.width, y: self.firstPointY * rect.height))
        aPath.addLine(to: CGPoint(x: self.secondPointX * rect.width, y: self.secondPointY * rect.height))
        aPath.addLine(to: CGPoint(x: self.thirdPointX * rect.width, y: self.thirdPointY * rect.height))
        aPath.close()
        self.color.set()
        aPath.fill()
    }

}
