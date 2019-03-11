//
//  ViewController.swift
//  
//  Created by Tasuku Maeda
//

import UIKit
import SimpleCAGraphics

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layerController = LayerController()
        layerController.setFrame(x: 0, y: 0, width: 100, height: 70)
            .translate(x: 100, y: 100)
            .setBackgroundColor(.red)
            .setOpacity(0.5)
        
        view.layer.addSublayer(layerController.layer)
    }
}

