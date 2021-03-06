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
    public func setWorkingLayerOpacityCG(_ opacity: CGFloat) -> Self {
        self.workingLayerOpacity = Float(opacity)
        return self
    }
    
    @discardableResult
    public func clear() -> Self {
        layer.sublayers?.removeAll()
        return self
    }
    
    @discardableResult
    public func moveTo(_ x: Double, _ y: Double) -> Self {
        return _moveTo(CGFloat(x), CGFloat(y))
    }
    
    @discardableResult
    public func moveToCG(_ x: CGFloat, _ y: CGFloat) -> Self {
        return _moveTo(x, y)
    }
    
    private func _moveTo(_ x: CGFloat, _ y: CGFloat) -> Self {
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
        return _lineTo(CGFloat(x), CGFloat(y))
    }
    
    @discardableResult
    public func lineToCG(_ x: CGFloat, _ y: CGFloat) -> Self {
        return _lineTo(x, y)
    }
    
    private func _lineTo(_ x: CGFloat, _ y: CGFloat) -> Self {
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
    public func drawLineCG(x0: CGFloat, y0: CGFloat, x1: CGFloat, y1: CGFloat) -> Self {
        moveToCG(x0, y0)
        lineToCG(x1, y1)
        return self
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
        let newLayer = createSameStyleShapeLayer()
        let mutablePath = CGMutablePath()
        mutablePath.addArc(center: CGPoint(x: x, y: y),
                           radius: radius,
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
                        startAngle: Double,
                        endAngle: Double,
                        clockwise: Bool = false) -> Self {
        
        return _drawArc(newPath: newPath,
                        x: CGFloat(x),
                        y: CGFloat(y),
                        radius: CGFloat(radius),
                        startAngle: CGFloat(startAngle),
                        endAngle: CGFloat(endAngle),
                        clockwise: clockwise)
    }
    
    @discardableResult
    public func drawArcCG(newPath: Bool = true,
                          x: CGFloat,
                          y: CGFloat,
                          radius: CGFloat,
                          startAngle: CGFloat,
                          endAngle: CGFloat,
                          clockwise: Bool = false) -> Self {
        
        return _drawArc(newPath: newPath,
                        x: x,
                        y: y,
                        radius: radius,
                        startAngle: startAngle,
                        endAngle: endAngle,
                        clockwise: clockwise)
    }
    
    private func _drawArc(newPath: Bool = true,
                          x: CGFloat,
                          y: CGFloat,
                          radius: CGFloat,
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
                           startAngle: CGFloat(startAngle),
                           endAngle: CGFloat(endAngle),
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
        
        return _drawArcDegree(newPath: newPath,
                              x: CGFloat(x),
                              y: CGFloat(y),
                              radius: CGFloat(radius),
                              startAngleDegree: CGFloat(startAngleDegree),
                              endAngleDegree: CGFloat(endAngleDegree),
                              clockwise: clockwise)
    }
    
    @discardableResult
    public func drawArcDegreeCG(newPath: Bool = true,
                                x: CGFloat,
                                y: CGFloat,
                                radius: CGFloat,
                                startAngleDegree: CGFloat,
                                endAngleDegree: CGFloat,
                                clockwise: Bool = false) -> Self {
        return _drawArcDegree(newPath: newPath,
                              x: x,
                              y: y,
                              radius: radius,
                              startAngleDegree: startAngleDegree,
                              endAngleDegree: endAngleDegree,
                              clockwise: clockwise)
    }
    
    private func _drawArcDegree(newPath: Bool = true,
                                x: CGFloat,
                                y: CGFloat,
                                radius: CGFloat,
                                startAngleDegree: CGFloat,
                                endAngleDegree: CGFloat,
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
                           radius: radius,
                           startAngle: startAngleDegree * convertRatio,
                           endAngle: endAngleDegree * convertRatio,
                           clockwise: clockwise)
        _workingLayer?.path = workingPath
        return self
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
