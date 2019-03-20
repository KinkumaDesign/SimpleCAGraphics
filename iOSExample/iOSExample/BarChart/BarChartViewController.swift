//
//  BarChartViewController.swift
//  
//  Created by Tasuku Maeda
//

import UIKit
import SimpleCAGraphics

class BarChartViewController: UIViewController {
    
    @IBOutlet weak var canvasView: UIView!
    
    var blackColor: UIColor? = HexColor.createColor("#333333")
    var chartMargin: (top: Double, right: Double, bottom: Double, left: Double) = (
        top: 30, right: 15, bottom: 50, left: 60
    )
    var chartData: BarChartData?
    var xScale: LinearScale = LinearScale()
    var yScale: LinearScale = LinearScale()
    var chartSize: CGSize = CGSize.zero
    var chartLayerController: LayerController = LayerController()
    
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }
    
    var maxValue: Double? {
        guard let chartData = chartData else { return nil }
        var maxValue: Double = -100
        chartData.data.forEach { maxValue = Double.maximum($0.value, maxValue)}
        return maxValue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = ViewController.PracticalExampleMenu.barChart.title
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupChart()
    }
    
    func decodeData() {
        let mapper = BarChartDataMapper()
        chartData = mapper.decode(fileName: "bar_chart_data.json")
    }
    
    func setupChart() {
        setChartSize()
        setupChartLayer()
        setupXScale()
        setupYScale()
        createXAxis()
        createYAxis()
        drawBars()
    }
    
    func setChartSize() {
        let viewSize = canvasView.bounds.size
        chartSize = CGSize(width: Double(viewSize.width) - chartMargin.right - chartMargin.left,
                           height: Double(viewSize.height) - chartMargin.top - chartMargin.bottom)
    }
    
    func setupChartLayer() {
        chartLayerController.setFrame(x: 0, y: 0, width: Double(chartSize.width), height: Double(chartSize.height))
            .translate(x: chartMargin.left, y: chartMargin.top)
        canvasView.layer.addSublayer(chartLayerController.layer)
    }
    
    func setupXScale() {
        guard let chartData = chartData else { return }
        xScale.domain([-0.5, Double(chartData.data.count - 1) + 0.5]).range([0, Double(chartSize.width)])
    }
    
    func setupYScale() {
        guard let maxValue = maxValue else { return }
        yScale.domain([0, maxValue + 100.0]).range([Double(chartSize.height), 0])
    }
    
    func createXAxis() {
        guard let chartData = chartData else { return }
        let graphicsController = GraphicsLayerController()
        chartLayerController.layer.addSublayer(graphicsController.layer)
        
        guard let posY = yScale.scale(0) else { return }
        graphicsController.setStrokeColor(blackColor)
            .setLineWidth(1)
            .drawLine(x0: 0, y0: posY, x1: Double(chartSize.width), y1: posY)
        
        for i in 0 ..< chartData.data.count {
            guard let posX = xScale.scale(Double(i)) else { continue }
            let datum = chartData.data[i]
            graphicsController.drawLine(x0: posX, y0: posY, x1: posX, y1: posY + 6.0)
            let textLayerController = TextLayerController()
            let halfTextWidth:Double = 18
            textLayerController.setText(datum.label)
                .setTextColor(blackColor)
                .setFontSize(14)
                .setAlignmentMode(.center)
                .setFrame(x: -halfTextWidth, y: 0, width: halfTextWidth * 2.0, height: 18.0)
                .translate(x: posX, y: posY + 10.0)
            chartLayerController.layer.addSublayer(textLayerController.layer)
        }
    }
    
    func createYAxis() {
        guard let maxValue = maxValue else { return }
        let graphicsController = GraphicsLayerController()
        chartLayerController.layer.addSublayer(graphicsController.layer)
        
        graphicsController.setStrokeColor(blackColor)
            .setLineWidth(1)
            //.drawLine(x0: 0, y0: 0, x1: 0, y1: Double(chartSize.height))
        
        for i in stride(from: 0, to: maxValue + 200, by: 200) {
            guard let posY = yScale.scale(i) else { continue }
            //graphicsController.drawLine(x0: -6, y0: posY, x1: 0, y1: posY)
            let textLayerController = TextLayerController()
            let label = numberFormatter.string(from: NSNumber(floatLiteral: i))
            textLayerController.setText(label)
                .setTextColor(blackColor)
                .setFontSize(14)
                .setAlignmentMode(.right)
                .setFrame(x: 0, y: 0, width: chartMargin.left, height: 18)
                .translate(x: -chartMargin.left - 14, y: posY - 10)
            chartLayerController.layer.addSublayer(textLayerController.layer)
            
            if i != 0 {
                //additional line in chart area
                let optionLineColor = HexColor.createColor("#cccccc")
                graphicsController
                    .setStrokeColor(optionLineColor)
                    .drawLine(x0: -6, y0: posY, x1: Double(chartSize.width), y1: posY)
            }
        }
    }
    
    func drawBars() {
        guard let chartData = chartData else { return }
        let graphicsController = GraphicsLayerController()
        chartLayerController.layer.addSublayer(graphicsController.layer)
        let barColor = HexColor.createColor("#3079dd")
        
        let barWidth = Double(chartSize.width) / Double(chartData.data.count) - 10
        let barHalfWidth = barWidth / 2
        var index = 0
        chartData.data.forEach{ datum in
            guard let startY = yScale.scale(datum.value),
                  let baseX = xScale.scale(Double(index)) else { return }
            let barHeight = Double(chartSize.height) - startY
            
            graphicsController
                .setFillColor(barColor)
                .drawRect(x: baseX - barHalfWidth, y: startY, width: barWidth, height: barHeight)
            
            let textLayerController = TextLayerController()
            let label = numberFormatter.string(from: NSNumber(floatLiteral: datum.value))
            let labelWidth:Double = 45
            textLayerController.setText(label)
                .setTextColor(barColor)
                .setFontSize(12)
                .setAlignmentMode(.center)
                .setFrame(x: 0, y: 0, width: labelWidth, height: 16)
                .translate(x: baseX - labelWidth / 2, y: startY - 20)
            graphicsController
                //.setWorkingLayerOpacity(0.7)
                .setFillColor(.white)
                .drawRect(x: baseX - labelWidth / 2, y: startY - 22, width: labelWidth, height: 17)
            chartLayerController.layer.addSublayer(textLayerController.layer)
            
            index += 1
        }
    }
}
