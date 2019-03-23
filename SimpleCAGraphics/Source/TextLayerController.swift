//
//  TextLayerController.swift
//
//  Created by Tasuku Maeda
//

import UIKit

public class TextLayerController: LayerController<CATextLayer> {
    
    public var textColor: UIColor? {
        get {
            guard let color = layer.foregroundColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            layer.foregroundColor = newValue?.cgColor
        }
    }
    
    public var text: String? {
        get {
            guard let layerText = layer.string as? String else { return nil }
            return layerText
        }
        set {
            layer.string = newValue
        }
    }
    
    public var font: UIFont? {
        get {
            guard let layerFont = layer.font,
                  let size = layerFont.pointSize else { return nil }
            return UIFont(name: layerFont.name, size: size)
        }
        set {
            layer.font = newValue
            if let size = newValue?.pointSize {
                layer.fontSize = size
            }
        }
    }
    
    public var fontSize: Float? {
        get {
            guard let layerFont = layer.font,
                let size = layerFont.pointSize else { return nil }
            return Float(size)
        }
        set {
            guard let value = newValue else { return }
            layer.fontSize = CGFloat(value)
        }
    }
    
    public var isWrapped: Bool {
        get {
            return layer.isWrapped
        }
        set {
            layer.isWrapped = newValue
        }
    }
    
    public var alignmentMode: CATextLayerAlignmentMode {
        get {
            return layer.alignmentMode
        }
        set {
            layer.alignmentMode = newValue
        }
    }
    
    public var truncationMode: CATextLayerTruncationMode {
        get {
            return layer.truncationMode
        }
        set {
            layer.truncationMode = newValue
        }
    }
    
    override public init(_ layer: CATextLayer = CATextLayer()) {
        super.init(layer)
        layer.fontSize = 14
    }
    
    @discardableResult
    public func setTextColor(_ textColor: UIColor?) -> Self {
        self.textColor = textColor
        return self
    }
    
    @discardableResult
    public func setText(_ text: String?) -> Self {
        self.text = text
        return self
    }
    
    @discardableResult
    public func setFont(_ font: UIFont?) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    public func setFontSize(_ size: Float) -> Self {
        self.fontSize = size
        return self
    }
    
    @discardableResult
    public func setFontSizeCG(_ size: CGFloat) -> Self {
        self.fontSize = Float(size)
        return self
    }
    
    @discardableResult
    public func setIsWrapped(_ wrapped: Bool) -> Self {
        self.isWrapped = wrapped
        return self
    }
    
    @discardableResult
    public func setAlignmentMode(_ mode: CATextLayerAlignmentMode) -> Self {
        self.alignmentMode = mode
        return self
    }
    
    @discardableResult
    public func setTruncationMode(_ mode: CATextLayerTruncationMode) -> Self {
        self.truncationMode = mode
        return self
    }
}
