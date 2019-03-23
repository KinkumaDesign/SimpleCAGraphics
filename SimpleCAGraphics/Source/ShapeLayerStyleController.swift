//
//  ShapeLayerFillStrokeController.swift
//
//  Created by Tasuku Maeda
//

import UIKit

protocol ShapeLayerStyleController {
    var fillColor: UIColor? { get set }
    var strokeColor: UIColor? { get set }
    var lineWidth: Double { get set }
    var lineCap: CAShapeLayerLineCap { get set }
    var lineDashPattern: [Double]? { get set }
    var lineJoin: CAShapeLayerLineJoin { get set }
    func setFillColor(_ fillColor: UIColor?) -> Self
    func setStrokeColor(_ strokeColor: UIColor?) -> Self
    func setLineWidth(_ lineWidth: Double) -> Self
    func setLineWidthCG(_ lineWidth: CGFloat) -> Self
    func setLineCap(_ lineCap: CAShapeLayerLineCap) -> Self
    func setLineDashPattern(_ lineDashPattern: [Double]?) -> Self
    func setLineDashPatternCG(_ lineDashPattern: [CGFloat]?) -> Self
    func setLineJoin(_ lineJoin: CAShapeLayerLineJoin) -> Self
}

extension LayerController: ShapeLayerStyleController where LAYER == CAShapeLayer {
    public var fillColor: UIColor? {
        get {
            guard let color = layer.fillColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            layer.fillColor = newValue?.cgColor
        }
    }
    
   public var strokeColor: UIColor? {
        get {
            guard let color = layer.strokeColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            layer.strokeColor = newValue?.cgColor
        }
    }
    
    public var lineWidth: Double {
        get {
            return Double(layer.lineWidth)
        }
        set {
            layer.lineWidth = CGFloat(newValue)
        }
    }
    
    public var lineCap: CAShapeLayerLineCap {
        get {
            return layer.lineCap
        }
        set {
            layer.lineCap = newValue
        }
    }
    
    public var lineDashPattern: [Double]? {
        get {
            guard let pattern = layer.lineDashPattern else { return nil }
            return pattern.map { Double(truncating: $0)}
        }
        set {
            guard let doublePattern = newValue else { return }
            layer.lineDashPattern = doublePattern.map { NSNumber(floatLiteral: $0) }
        }
    }
    
    public var lineJoin: CAShapeLayerLineJoin {
        get {
            return layer.lineJoin
        }
        set {
            layer.lineJoin = newValue
        }
    }
    
    @discardableResult
    public func setFillColor(_ fillColor: UIColor?) -> Self {
        self.fillColor = fillColor
        return self
    }
    
    @discardableResult
    public func setStrokeColor(_ strokeColor: UIColor?) -> Self {
        self.strokeColor = strokeColor
        return self
    }
    
    @discardableResult
    public func setLineWidth(_ lineWidth: Double) -> Self {
        self.lineWidth = lineWidth
        return self
    }
    
    @discardableResult
    public func setLineWidthCG(_ lineWidth: CGFloat) -> Self {
        self.lineWidth = Double(lineWidth)
        return self
    }

    @discardableResult
    func setLineCap(_ lineCap: CAShapeLayerLineCap) -> Self {
        self.lineCap = lineCap
        return self
    }
    
    @discardableResult
    public func setLineDashPattern(_ lineDashPattern: [Double]?) -> Self {
        self.lineDashPattern = lineDashPattern
        return self
    }
    
    @discardableResult
    public func setLineDashPatternCG(_ lineDashPattern: [CGFloat]?) -> Self {
        let doubledPattern = lineDashPattern?.map { Double($0) }
        self.lineDashPattern = doubledPattern
        return self
    }
    
    @discardableResult
    public func setLineJoin(_ lineJoin: CAShapeLayerLineJoin) -> Self {
        self.lineJoin = lineJoin
        return self
    }
}
