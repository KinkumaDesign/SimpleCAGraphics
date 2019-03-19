//
//  GraphicsLayerController.swift
//
//  Created by Tasuku Maeda
//

import UIKit

public class GraphicsLayerController: LayerController<CAShapeLayer> {
    
    public var workingLayerOpacity: Float = 1
    
    private var _workingLayer: CAShapeLayer?
    public var workingLayer: CAShapeLayer? {
        return _workingLayer
    }
    
    private var _workingPath: CGMutablePath?
    public var workingPath: CGMutablePath? {
        return _workingPath
    }
    
    override public init(_ layer: CAShapeLayer = CAShapeLayer()) {
        super.init(layer)
    }
    
    public func addPath(path: CGPath) {
        let resultPath = CGMutablePath()
        if let currentPath = layer.path {
            resultPath.addPath(currentPath)
        }
        resultPath.addPath(path)
        layer.path = resultPath
    }
    
    private func createSameStyleShapeLayer() -> CAShapeLayer {
        let controller = GraphicsLayerController()
        controller.setFillColor(fillColor)
                  .setStrokeColor(strokeColor)
                  .setLineWidth(lineWidth)
                  .setLineCap(lineCap)
                  .setLineDashPattern(lineDashPattern)
                  .setLineJoin(lineJoin)
        controller.layer.opacity = workingLayerOpacity
        workingLayerOpacity = 1
        return controller.layer
    }
    
    @discardableResult
    public func setWorkingLayerOpacity(_ opacity: Float) -> Self {
        self.workingLayerOpacity = opacity
        return self
    }
    
    @discardableResult
    public func clear() -> Self {
        layer.sublayers?.removeAll()
        return self
    }
    
    @discardableResult
    public func moveTo(_ x: Double, _ y: Double) -> Self {
        let newLayer = createSameStyleShapeLayer()
        _workingLayer = newLayer
        layer.addSublayer(newLayer)
        _workingPath = CGMutablePath()
        if let path = _workingPath {
            path.move(to: CGPoint(x: x, y: y))
            _workingLayer?.path = path
        }
        return self
    }
    
    @discardableResult
    public func lineTo(_ x: Double, _ y: Double) -> Self {
        guard let workingPath = _workingPath else { return self }
        workingPath.addLine(to: CGPoint(x: x, y: y))
        _workingLayer?.path = workingPath
        return self
    }
    
    @discardableResult
    public func closePath() -> Self {
        guard let workingPath = _workingPath else { return self }
        workingPath.closeSubpath()
        _workingLayer?.path = workingPath
        return self
    }
    
    @discardableResult
    public func drawLine(x0: Double, y0: Double, x1: Double, y1: Double) -> Self {
        moveTo(x0, y0)
        lineTo(x1, y1)
        return self
    }
    
    @discardableResult
    public func drawCircle(x: Double, y: Double, radius: Double) -> Self {
        let newLayer = createSameStyleShapeLayer()
        let mutablePath = CGMutablePath()
        mutablePath.addArc(center: CGPoint(x: x, y: y),
                           radius: CGFloat(radius),
                           startAngle: 0,
                           endAngle: CGFloat.pi * 2,
                           clockwise: true)
        newLayer.path = mutablePath
        layer.addSublayer(newLayer)
        _workingLayer = newLayer
        _workingPath = mutablePath
        return self
    }
    
    @discardableResult
    public func drawArc(newPath: Bool = true,
                        x: Double,
                        y: Double,
                        radius: Double,
                        startAngle: CGFloat,
                        endAngle: CGFloat,
                        clockwise: Bool = false) -> Self {
        if newPath {
            let newLayer = createSameStyleShapeLayer()
            layer.addSublayer(newLayer)
            _workingLayer = newLayer
            
            let mutablePath = CGMutablePath()
            _workingPath = mutablePath
        }
        guard let workingPath = _workingPath else { return self }
        workingPath.addArc(center: CGPoint(x: x, y: y),
                           radius: CGFloat(radius),
                           startAngle: startAngle,
                           endAngle: endAngle,
                           clockwise: clockwise)
        _workingLayer?.path = workingPath
        return self
    }
    
    @discardableResult
    public func drawArcDegree(newPath: Bool = true,
                              x: Double,
                              y: Double,
                              radius: Double,
                              startAngleDegree: Double,
                              endAngleDegree: Double,
                              clockwise: Bool = false) -> Self {
        if newPath {
            let newLayer = createSameStyleShapeLayer()
            layer.addSublayer(newLayer)
            _workingLayer = newLayer
            
            let mutablePath = CGMutablePath()
            _workingPath = mutablePath
        }
        guard let workingPath = _workingPath else { return self }
        let convertRatio:CGFloat = CGFloat.pi / CGFloat(180)
        workingPath.addArc(center: CGPoint(x: x, y: y),
                           radius: CGFloat(radius),
                           startAngle: CGFloat(startAngleDegree) * convertRatio,
                           endAngle: CGFloat(endAngleDegree) * convertRatio,
                           clockwise: clockwise)
        _workingLayer?.path = workingPath
        return self
    }
    
    @discardableResult
    public func drawRect(x: Double, y: Double, width: Double, height: Double) -> Self {
        let newLayer = createSameStyleShapeLayer()
        let rect = CGRect(x: x, y: y, width: width, height: height)
        let mutablePath = CGMutablePath()
        mutablePath.addRect(rect)
        newLayer.path = mutablePath
        layer.addSublayer(newLayer)
        _workingLayer = newLayer
        _workingPath = mutablePath
        return self
    }
}
