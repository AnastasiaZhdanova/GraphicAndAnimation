//
//  GraphView.swift
//  DrawGraphic
//
//  Created by Anastasia Zhdanova on 1/11/19.
//  Copyright © 2019 Anastasia Zhdanova. All rights reserved.
//

import UIKit

@IBDesignable
class GraphView: UIView {

    @IBInspectable var lineColor : UIColor = UIColor.green
    @IBInspectable var lineWidth : CGFloat = 3.0
    
    private struct Constants{
        static let margin: CGFloat = 0.0
        static let topBorder: CGFloat = 50
        static let bottomBorder: CGFloat = 50
        static let colorAlpha: CGFloat = 1
    }
    
    private var graphPoints: [Float] = [0.0,0.0,0.0,25.0,17.0,22.0,16.0,3.0,25.0,0.0]
    private var circleLayer: CAShapeLayer!
    override func draw(_ rect: CGRect) {
        let width = rect.width
        let height = rect.height
        let margin = Constants.margin
        let graphWidth = width - margin * 2
        let columnXPount = {
            (clumn: Float) -> CGFloat in
            let spacing = graphWidth / CGFloat(self.graphPoints.count - 1)
            return CGFloat(clumn) * spacing + margin
        }
        let graphHeight = height - Constants.topBorder - Constants.bottomBorder
        let maxValue = graphPoints.max()!
        let columnYPoint = {
            (graphPoint: Float) -> CGFloat in
            let y = CGFloat(graphPoint) / CGFloat(maxValue) * graphHeight
            return graphHeight + Constants.topBorder - y
        }
        let graphPath = UIBezierPath()
        graphPath.move(to: CGPoint(x: columnXPount(0),y: columnYPoint(graphPoints[0])))
        for (index, value) in graphPoints.enumerated(){
            let nextPoint = CGPoint(x: columnXPount(Float(index)), y: columnYPoint(value))
            graphPath.addLine(to: nextPoint)
        }
        circleLayer = CAShapeLayer()
        circleLayer.path = graphPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = lineColor.cgColor
        circleLayer.lineWidth = lineWidth
        circleLayer.strokeEnd = 1.0
        layer.addSublayer(circleLayer)
        
        let animationGraph = CABasicAnimation(keyPath: "strokeEnd")
        animationGraph.duration = 5
        animationGraph.fromValue = 0
        animationGraph.toValue = 1
        circleLayer.add(animationGraph, forKey: "lessAnimation")
    }
}
