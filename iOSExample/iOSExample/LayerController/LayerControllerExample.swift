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
        addImages()
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
            .setFrame(x: 100, y: 20, width: 100, height: 80)
        
        canvasView.layer.addSublayer(layerController.layer)
    }
    
    func transform() {
        let layerController = LayerController()
        let color = HexColor.createColor("#70aeed")
        layerController.setBackgroundColor(color)
            .setFrame(x: 0, y: 0, width: 100, height: 80)
            .translate(x: 100, y: 100)
            .rotate(radian: .pi / 4)
            .scale(scaleX: 1.5, scaleY: 1.5)
        
        canvasView.layer.addSublayer(layerController.layer)
    }
    
    func addImages() {
        guard let smileImage = UIImage(named: "smile"),
            let leftArrowImage = UIImage(named: "leftArrow") else { return }
        let layerController = LayerController()
        layerController.setImage(smileImage)
            .translate(x: 10, y: 300)
        canvasView.layer.addSublayer(layerController.layer)
        
        let layerController2 = LayerController()
        layerController2.setImage(leftArrowImage)
            .translate(x: 160, y: 300)
        canvasView.layer.addSublayer(layerController2.layer)
    }
}
