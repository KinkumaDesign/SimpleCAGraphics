//
//  BarChartDataMapper.swift
//  
//  Created by Tasuku Maeda
//

import Foundation

class BarChartDataMapper {
    func decode(fileName: String) -> BarChartData? {
        
        var chartData: BarChartData?
        do {
            guard let path = Bundle.main.path(forResource: fileName, ofType: nil),
                  let jsonText = try? String(contentsOfFile: path, encoding: .utf8),
                  let jsonData = jsonText.data(using: .utf8)  else {
                    return nil
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            chartData = try decoder.decode(BarChartData.self, from: jsonData)
        } catch {
            print("\(error.localizedDescription)")
            return nil
        }
        return chartData
    }
}
