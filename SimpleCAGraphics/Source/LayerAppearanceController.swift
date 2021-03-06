//
//  LayerAppearanceController.swift
//
//  Created by Tasuku Maeda
//

import UIKit

protocol LayerAppearanceController {
    var opacity: Float { get set }
    var isHidden: Bool { get set }
    var maskToBounds: Bool { get set }
    var mask: CALayer? { get set }
    var borderWidth: Double { get set }
    var borderColor: UIColor? { get set }
    var shadowOpacity: Float { get set }
    var shadowRadius: Double { get set }
    var shadowOffset: CGSize { get set }
    var shadowColor: UIColor? { get set }
    var cornerRadius: Float { get set }
    var backgroundColor: UIColor? { get set }
    
    func setOpacity(_ opacity: Float) -> Self
    func setOpacityCG(_ opacity: CGFloat) -> Self
    func setIsHidden(_ isHidden: Bool) -> Self
    func setMaskToBounds(_ maskToBounds: Bool) -> Self
    func setMask(_ mask: CALayer?) -> Self
    func setBorderWidth(_ width: Double) -> Self
    func setBorderWidthCG(_ width: CGFloat) -> Self
    func setBorderColor(_ color: UIColor?) -> Self
    func setCornerRadius(_ radius: Float) -> Self
    func setCornerRadiusCG(_ radius: CGFloat) -> Self
    func setShadowOpacity(_ opacity: Float) -> Self
    func setShadowOpacityCG(_ opacity: CGFloat) -> Self
    func setShadowRadius(_ radius: Double) -> Self
    func setShadowRadiusCG(_ radius: CGFloat) -> Self
    func setShadowOffset(width: Double, height: Double) -> Self
    func setShadowOffsetCG(width: CGFloat, height: CGFloat) -> Self
    func setShadowOffset(size: CGSize) -> Self
    func setShadowColor(_ color: UIColor?) -> Self
    func setBackgroundColor(_ color: UIColor?) -> Self
}
