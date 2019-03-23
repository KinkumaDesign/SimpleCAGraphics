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
    
    convenience public init(x: Double, y: Double, width: Double, height: Double) {
        self.init()
        drawRect(x: x, y: y, width: width, height: height)
    }
    
    convenience public init(cgX: CGFloat, cgY: CGFloat, cgWidth: CGFloat, cgHeight: CGFloat) {
        self.init()
        drawRectCG(x: cgX, y: cgY, width: cgWidth, height: cgHeight)
    }
    
    @discardableResult
    public func drawRect(x: Double, y: Double, width: Double, height: Double) -> Self {
        return _drawRect(x: CGFloat(x), y: CGFloat(y), width: CGFloat(width), height: CGFloat(height))
    }
    
    @discardableResult
    public func drawRectCG(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> Self {
        return _drawRect(x: x, y: y, width: width, height: height)
    }
    
    private func _drawRect(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> Self {
        let rect = CGRect(x: x, y: y, width: width, height: height)
        let mutablePath = CGMutablePath()
        mutablePath.addRect(rect)
        layer.path = mutablePath
        return self
    }
}
