//
//  LayerControllerExample.swift
//  
//  Created by Tasuku Maeda
//

import UIKit
import SimpleCAGraphics

class LayerControllerExample: UIViewController {
    @IBOutlet weak var canvasView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appearance()
        transform()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = ViewController.Menu.layerController.title
    }
    
    func appearance() {
        let layerController = LayerController()
        layerController.setOpacity(0.5)
            .setCornerRadius(8)
            .setBackgroundColor(.red)
            .setFrame(x: 100, y: 80, width: 100, height: 80)
        
        canvasView.layer.addSublayer(layerController.layer)
    }
    
    func transform() {
        let layerController = LayerController()
        layerController.setBackgroundColor(.blue)
            .setFrame(x: 0, y: 0, width: 100, height: 80)
            .translate(x: 100, y: 180)
            .rotate(radian: .pi / 4)
            .scale(scaleX: 1.5, scaleY: 1.5)
        
        canvasView.layer.addSublayer(layerController.layer)
    }
}
