//
//  BasicViewController.swift
//  
//  Created by Tasuku Maeda
//

import UIKit
import SimpleCAGraphics

class BasicViewController: UIViewController {
    
    @IBOutlet weak var canvasView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        methodChaining()
        normalCall()
    }
    
    func methodChaining() {
        let layerController = LayerController()
        layerController.setFrame(x: 0, y: 0, width: 100, height: 80)
            .setBackgroundColor(.red)
            .translate(x: 120, y: 50)
            .rotate(radian: .pi / 10)
        
        canvasView.layer.addSublayer(layerController.layer)
    }
    
    func normalCall() {
        let layerController = LayerController()
        layerController.frame = CGRect(x: 0, y: 0, width: 100, height: 80)
        layerController.backgroundColor = .blue
        layerController.x = 120
        layerController.y = 180
        layerController.rotation = .pi / 10
        
        canvasView.layer.addSublayer(layerController.layer)
    }
}
