//
//  TextLayerControllerExample.swift
//  
//  Created by Tasuku Maeda
//

import UIKit
import SimpleCAGraphics

class TextLayerControllerExample: UIViewController {
    @IBOutlet weak var canvasView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basic()
        attributes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = ViewController.BasicExampleMenu.textLayerController.title
    }
    
    func basic() {
        let textLayerController = TextLayerController()
        let color = HexColor.createColor("#d7445c")
        textLayerController.setText("Hello World")
            .setFont(UIFont.systemFont(ofSize: 24, weight: .bold))
            .setTextColor(color)
            .setFrame(x: 0, y: 0, width: 200, height: 30)
            .translate(x: 100, y: 80)
        
        canvasView.layer.addSublayer(textLayerController.layer)
    }
    
    func attributes() {
        let textLayerController = TextLayerController()
        let bgColor = HexColor.createColor("#dfe2b6")
        textLayerController.setText("Hello World1 Hello World2")
            .setIsWrapped(true)
            .setFrame(x: 0, y: 0, width: 280, height: 30)
            .setFontSize(18)
            .setTextColor(.black)
            .setAlignmentMode(.right)
            .setTruncationMode(.end)
            .translate(x: 20, y: 180)
            .setBackgroundColor(bgColor)
        
        canvasView.layer.addSublayer(textLayerController.layer)
    }
}
