//
//  BarChartData.swift
//  
//  Created by Tasuku Maeda
//

import Foundation

struct BarChartData: Codable {
    
    var data: [BarChartDatum]
    
    struct BarChartDatum: Codable {
        var value: Double
        var label: String?
    }
}
