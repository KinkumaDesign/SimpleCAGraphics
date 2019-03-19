//
//  LayerContentsController.swift
//  
//  Created by Tasuku Maeda
//

import UIKit

protocol LayerContentsController {
    var image: UIImage? { get set }
    var contentsRect: CGRect { get set }
    var contentsCenter: CGRect { get set }
    var contentsGravity: CALayerContentsGravity { get set }
    
    func setImage(_ image: UIImage?) -> Self
    func setContentsRect(x: Double, y: Double, width: Double, height: Double) -> Self
    func setContentsRect(rect: CGRect) -> Self
    func setContentsCenter(x: Double, y: Double, width: Double, height: Double) -> Self
    func setContentsCenter(rect: CGRect) -> Self
    func setContentsGravity(_ contentsGravity: CALayerContentsGravity) -> Self
}
