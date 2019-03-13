//
//  RectLayerController.swift
//
//  Created by Tasuku Maeda
//

import UIKit

public class RectLayerController: LayerController<CAShapeLayer> {
    
    override public init(_ layer: CAShapeLayer = CAShapeLayer()) {
        super.init(layer)
    }
    
    convenience init(x: Double, y: Double, width: Double, height: Double) {
        self.init()
        drawRect(x: x, y: y, width: width, height: height)
    }
    
    @discardableResult
    public func drawRect(x: Double, y: Double, width: Double, height: Double) -> Self {
        let rect = CGRect(x: x, y: y, width: width, height: height)
        let mutablePath = CGMutablePath()
        mutablePath.addRect(rect)
        layer.path = mutablePath
        return self
    }
}
