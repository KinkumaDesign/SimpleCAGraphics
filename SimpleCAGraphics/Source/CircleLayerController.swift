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
    
    @discardableResult
    public func drawCircle(x: Double, y: Double, radius: Double) -> Self {
        let mutablePath = CGMutablePath()
        mutablePath.addArc(center: CGPoint(x: x, y: y),
                     radius: CGFloat(radius),
                     startAngle: 0,
                     endAngle: CGFloat.pi * 2,
                     clockwise: true)
        layer.path = mutablePath
        return self
    }
}
