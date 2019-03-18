//
//  RectLayerControllerExample.swift
//  
//  Created by Tasuku Maeda
//

import UIKit
import SimpleCAGraphics

class RectLayerControllerExample: UIViewController {
    @IBOutlet weak var canvasView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initExample()
        drawRect()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = ViewController.Menu.rectLayerController.title
    }
    
    func initExample() {
        let rectLayerController = RectLayerController(x: 0, y: 0, width: 100, height: 80)
        rectLayerController.setFillColor(.red)
            .setStrokeColor(.blue)
            .setLineWidth(5)
            .translate(x: 100, y: 80)
        canvasView.layer.addSublayer(rectLayerController.layer)
    }
    
    func drawRect() {
        let rectLayerController = RectLayerController()
        rectLayerController.drawRect(x: 100, y: 240, width: 100, height: 80)
            .setFillColor(nil)
            .setLineWidth(5)
            .setStrokeColor(.purple)
        canvasView.layer.addSublayer(rectLayerController.layer)
    }
}
