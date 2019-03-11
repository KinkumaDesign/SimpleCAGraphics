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
    
    override public init(_ layer: CATextLayer = CATextLayer()) {
        super.init(layer)
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
}
