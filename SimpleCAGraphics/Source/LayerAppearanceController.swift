//
//  LayerAppearanceController.swift
//
//  Created by Tasuku Maeda
//

import UIKit

protocol LayerAppearanceController {
    var opacity: Float { get set }
    var cornerRadius: Float { get set }
    var backgroundColor: UIColor? { get set }
    func setOpacity(_ opacity: Float) -> Self
    func setCornerRadius(_ cornerRadius: Float) -> Self
    func setBackgroundColor(_ backgroundColor: UIColor?) -> Self
}
