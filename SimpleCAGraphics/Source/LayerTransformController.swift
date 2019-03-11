//
//  LayerTransformController.swift
//
//  Created by Tasuku Maeda
//

import UIKit

public struct TransformProps {
    public var x: Double = 0
    public var y: Double = 0
    public var rotation: Double = 0
    public var scaleX: Double = 1
    public var scaleY: Double = 1
}

protocol LayerTransformController {
    var x: Double { get set }
    var y: Double { get set }
    var rotation: Double { get set }
    var scaleX: Double { get set }
    var scaleY: Double { get set }
    var frame: CGRect { get set }
    func translate(x: Double, y: Double) -> Self
    func rotate(radian: Double) -> Self
    func scale(scaleX: Double, scaleY: Double) -> Self
    func applyTransform() -> Self
    func setFrame(x: Double, y: Double, width: Double, height: Double) -> Self
    func setFrame(frame: CGRect) -> Self
}
