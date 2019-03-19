//
//  BarChartViewController.swift
//  
//  Created by Tasuku Maeda
//

import UIKit

class BarChartViewController: UIViewController {
    
    @IBOutlet weak var canvasView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = ViewController.PracticalExampleMenu.barChart.title
    }
}
