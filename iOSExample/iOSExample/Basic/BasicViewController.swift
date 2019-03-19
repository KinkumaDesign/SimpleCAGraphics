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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = ViewController.BasicExampleMenu.basic.title
    }
    
    func methodChaining() {
        let layerController = LayerController()
        layerController.setFrame(x: 0, y: 0, width: 100, height: 80)
            .setBorderColor(.blue)
            .setBorderWidth(5)
            .setBackgroundColor(.red)
            .translate(x: 120, y: 30)
            .rotate(radian: .pi / 10)
        
        canvasView.layer.addSublayer(layerController.layer)
    }
    
    func normalCall() {
        let layerController = LayerController()
        layerController.frame = CGRect(x: 0, y: 0, width: 100, height: 80)
        layerController.backgroundColor = .blue
        layerController.x = 120
        layerController.y = 150
        layerController.rotation = .pi / 10
        
        canvasView.layer.addSublayer(layerController.layer)
    }
}
