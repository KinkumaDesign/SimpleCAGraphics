//
//  LayerController.swift
//
//  Created by Tasuku Maeda
//

import UIKit

public class LayerController<LAYER> where LAYER: CALayer {
    public var layer: LAYER {
        didSet {
            didSetLayer()
        }
    }
    public var transformProps: TransformProps = TransformProps()
    
    public init(_ layer: LAYER = LAYER()) {
        self.layer = layer
        didSetLayer()
    }
    
    private func didSetLayer() {
        layer.anchorPoint = CGPoint(x: 0, y: 0)
        layer.contentsScale = UIScreen.main.scale
        transformProps = TransformProps()
    }
}

// MARK: Equatable

extension LayerController: Equatable {
    public static func == (lhs: LayerController<LAYER>, rhs: LayerController<LAYER>) -> Bool {
        return lhs === rhs
    }
}

// MARK: LayerTransformController

extension LayerController: LayerTransformController {
    public var x: Double {
        get {
            return transformProps.x
        }
        set {
            transformProps.x = newValue
            applyTransform()
        }
    }
    
    public var y: Double {
        get {
            return transformProps.y
        }
        set {
            transformProps.y = newValue
            applyTransform()
        }
    }
    
    public var rotation: Double {
        get {
            return transformProps.rotation
        }
        set {
            transformProps.rotation = newValue
            applyTransform()
        }
    }
    
    public var scaleX: Double {
        get {
            return transformProps.scaleX
        }
        set {
            transformProps.scaleX = newValue
            applyTransform()
        }
    }
    
    public var scaleY: Double {
        get {
            return transformProps.scaleY
        }
        set {
            transformProps.scaleY = newValue
            applyTransform()
        }
    }
    
    public var frame: CGRect {
        get {
            return layer.frame
        }
        set {
            layer.frame = newValue
        }
    }
    
    @discardableResult
    public func translate(x: Double, y: Double) -> Self {
        transformProps.x = x
        transformProps.y = y
        applyTransform()
        return self
    }
    
    @discardableResult
    public func rotate(radian: Double) -> Self {
        transformProps.rotation = radian
        applyTransform()
        return self
    }
    
    @discardableResult
    public func scale(scaleX: Double, scaleY: Double) -> Self {
        transformProps.scaleX = scaleX
        transformProps.scaleY = scaleY
        applyTransform()
        return self
    }
    
    @discardableResult
    public func applyTransform() -> Self {
        let translateTrans = CATransform3DMakeTranslation(CGFloat(transformProps.x),
                                                          CGFloat(transformProps.y),
                                                          0)
        let rotateTrans = CATransform3DRotate(translateTrans,
                                              CGFloat(transformProps.rotation),
                                              0, 0, 1)
        let scaleTrans = CATransform3DScale(rotateTrans,
                                            CGFloat(transformProps.scaleX),
                                            CGFloat(transformProps.scaleY),
                                            1)
        layer.transform = scaleTrans
        return self
    }
    
    @discardableResult
    public func setFrame(x: Double, y: Double, width: Double, height: Double) -> Self {
        layer.frame = CGRect(x: x, y: y, width: width, height: height)
        return self
    }
    
    @discardableResult
    public func setFrame(frame: CGRect) -> Self {
        layer.frame = frame
        return self
    }
}

// MARK: LayerAppearanceController

extension LayerController: LayerAppearanceController {
    public var opacity: Float {
        get {
            return layer.opacity
        }
        set {
            layer.opacity = newValue
        }
    }
    
    public var cornerRadius: Float {
        get {
            return Float(layer.cornerRadius)
        }
        set {
            layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    public var backgroundColor: UIColor? {
        get {
            guard let color = layer.backgroundColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            layer.backgroundColor = newValue?.cgColor
        }
    }
    
    @discardableResult
    public func setOpacity(_ opacity: Float) -> Self {
        self.opacity = opacity
        return self
    }
    
    @discardableResult
    public func setCornerRadius(_ cornerRadius: Float) -> Self {
        self.cornerRadius = cornerRadius
        return self
    }
    
    @discardableResult
    public func setBackgroundColor(_ backgroundColor: UIColor?) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }
}
