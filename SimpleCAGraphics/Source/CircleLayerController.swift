//
//  CircleLayerController.swift
//
//  Created by Tasuku Maeda
//

import UIKit

public class CircleLayerController: LayerController<CAShapeLayer> {
    
    override public init(_ layer: CAShapeLayer = CAShapeLayer()) {
        super.init(layer)
    }
    
    convenience public init(x: Double, y: Double, radius: Double) {
        self.init()
        drawCircle(x: x, y: y, radius: radius)
    }
    
    convenience public init(cgX: CGFloat, cgY: CGFloat, cgRadius: CGFloat) {
        self.init()
        drawCircleCG(x: cgX, y: cgY, radius: cgRadius)
    }
    
    @discardableResult
    public func drawCircle(x: Double, y: Double, radius: Double) -> Self {
        return _drawCircle(x: CGFloat(x), y: CGFloat(y), radius: CGFloat(radius))
    }
    
    @discardableResult
    public func drawCircleCG(x: CGFloat, y: CGFloat, radius: CGFloat) -> Self {
        return _drawCircle(x: x, y: y, radius: radius)
    }
    
    private func _drawCircle(x: CGFloat, y: CGFloat, radius: CGFloat) -> Self {
        let mutablePath = CGMutablePath()
        mutablePath.addArc(center: CGPoint(x: x, y: y),
                           radius: radius,
                           startAngle: 0,
                           endAngle: CGFloat.pi * 2,
                           clockwise: true)
        layer.path = mutablePath
        return self
    }
}
