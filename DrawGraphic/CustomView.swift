//
//  CustomView.swift
//  DrawGraphic
//
//  Created by Anastasia Zhdanova on 1/11/19.
//  Copyright © 2019 Anastasia Zhdanova. All rights reserved.
//
//import CoreGraphics
import UIKit
import Darwin

@IBDesignable
class CustomView: UIView {

    private var circleLayer: CAShapeLayer!
    private struct Constants{
        static let arcWidth: CGFloat = 3
    }

    @IBInspectable  var arcColor: UIColor = UIColor.red
    

    override func draw(_ rect: CGRect) {
        self.backgroundColor = UIColor.clear
        
        let startAngle: CGFloat = 2 * .pi / 2
        let endAngle: CGFloat = .pi / 2
        let center = CGPoint (x: bounds.width/2, y: bounds.height/2)
        let radius: CGFloat = max(bounds.width/2, bounds.height/2)
       
        let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = arcColor.cgColor
        circleLayer.lineWidth = Constants.arcWidth
        circleLayer.lineDashPattern = [13]
        circleLayer.strokeEnd = 1.0
        layer.addSublayer(circleLayer)
        
        
        let animationRound = CABasicAnimation(keyPath: "strokeEnd")
        animationRound.duration = 3
        animationRound.fromValue = 0
        animationRound.toValue = 1
        circleLayer.add(animationRound, forKey: "lessAnimation")
        
            let animationInfinityRound = CABasicAnimation(keyPath: "lineDashPhase")
            animationInfinityRound.byValue = 10.0
            animationInfinityRound.duration = 1.5
            animationInfinityRound.timingFunction = CAMediaTimingFunction( name: CAMediaTimingFunctionName.linear)
            animationInfinityRound.repeatCount = .greatestFiniteMagnitude
           circleLayer.add(animationInfinityRound, forKey: "lineDashPhaseAnimation")
        
        
    }
    
    
    
}
