//
//  BarChartViewController.swift
//  
//  Created by Tasuku Maeda
//

import UIKit

class BarChartViewController: UIViewController {
    
    @IBOutlet weak var canvasView: UIView!
    
    var chartData: BarChartData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = ViewController.PracticalExampleMenu.barChart.title
    }
    
    func decodeData() {
        let mapper = BarChartDataMapper()
        chartData = mapper.decode(fileName: "bar_chart_data.json")
    }
}
