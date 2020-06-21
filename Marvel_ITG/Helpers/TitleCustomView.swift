//
//  TitleCustomView.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/20/20.
//

import UIKit

@IBDesignable
class TitleCustomView: UIView {
    
    @IBInspectable var offset: CGFloat = 10.0 {
        didSet { setNeedsDisplay() }
    }
    
    @IBInspectable var fillColor: UIColor = .white {
        didSet { setNeedsDisplay() }
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: bounds.minX + offset, y: bounds.minY))
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.minY))
        path.addLine(to: CGPoint(x: bounds.maxX - offset, y: bounds.maxY))
        path.addLine(to: CGPoint(x: bounds.minX, y: bounds.maxY))
        
        path.close()
        fillColor.setFill()
        path.fill()
    }
    
}
