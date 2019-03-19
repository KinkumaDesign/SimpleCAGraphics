//
//  CircleLayerControllerExample.swift
//  
//  Created by Tasuku Maeda
//

import UIKit
import SimpleCAGraphics

class CircleLayerControllerExample: UIViewController {
    @IBOutlet weak var canvasView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initExample()
        drawCircle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = ViewController.BasicExampleMenu.circleLayerController.title
    }
    
    func initExample() {
        let circleLayerController = CircleLayerController(x: 0, y: 0, radius: 50)
        circleLayerController.setFillColor(.red)
            .setStrokeColor(.blue)
            .setLineWidth(5)
            .translate(x: 100, y: 80)
        canvasView.layer.addSublayer(circleLayerController.layer)
    }
    
    func drawCircle() {
        let circleLayerController = CircleLayerController()
        circleLayerController.drawCircle(x: 0, y: 0, radius: 50)
            .setFillColor(nil)
            .setLineWidth(5)
            .setStrokeColor(.purple)
            .translate(x: 100, y: 240)
        canvasView.layer.addSublayer(circleLayerController.layer)
    }
}
