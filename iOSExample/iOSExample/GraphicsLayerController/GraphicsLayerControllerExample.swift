//
//  GraphicsLayerControllerExample.swift
//  
//  Created by Tasuku Maeda
//

import UIKit
import SimpleCAGraphics

class GraphicsLayerControllerExample: UIViewController {
    @IBOutlet weak var canvasView: UIView!
    let graphicsLayerController: GraphicsLayerController = GraphicsLayerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        canvasView.layer.addSublayer(graphicsLayerController.layer)
        
        drawLine()
        drawRect()
        drawCircle()
        drawPaths()
        drawArc()
        drawArcDegree()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = ViewController.BasicExampleMenu.graphicsLayerController.title
    }
    
    @IBAction func clearButtonTapped() {
        graphicsLayerController.clear()
    }
    
    func drawLine() {
        graphicsLayerController
            .setLineWidth(3)
            .setStrokeColor(.red)
            .drawLine(x0: 100, y0: 100, x1: 200, y1: 100)
            .setStrokeColor(.blue)
            .drawLine(x0: 100, y0: 150, x1: 200, y1: 80)
    }
    
    func drawRect() {
        graphicsLayerController
            .setLineWidth(5)
            .setStrokeColor(.purple)
            .setFillColor(.red)
            .setWorkingLayerOpacity(0.3)
            .drawRect(x: 150, y: 200, width: 100, height: 80)
    }
    
    func drawCircle() {
        graphicsLayerController
            .setLineWidth(5)
            .setStrokeColor(.red)
            .setFillColor(nil)
            .drawCircle(x: 100, y: 250, radius: 30)
    }
    
    func drawPaths() {
        graphicsLayerController
            .setLineWidth(5)
            .setStrokeColor(.blue)
            .setFillColor(nil)
            .moveTo(100, 350)
            .lineTo(200, 350)
            .lineTo(200, 400)
            .lineTo(100, 400)
    }
    
    func drawArc() {
        let centerX: Double = 100
        let centerY: Double = 450
        graphicsLayerController
            .setLineWidth(1)
            .setStrokeColor(.purple)
            .setFillColor(.red)
            .moveTo(centerX, centerY)
            .drawArc(newPath: false,
                     x: centerX,
                     y: centerY,
                     radius: 30,
                     startAngle: 0,
                     endAngle: Double.pi * 1.5,
                     clockwise: false)
            .closePath()
    }
    
    func drawArcDegree() {
        graphicsLayerController
            .setLineWidth(15)
            .setStrokeColor(.green)
            .setFillColor(nil)
            .drawArcDegree(newPath: true,
                           x: 250,
                           y: 450,
                           radius: 30,
                           startAngleDegree: 0,
                           endAngleDegree: 270,
                           clockwise: true)
    }
}
