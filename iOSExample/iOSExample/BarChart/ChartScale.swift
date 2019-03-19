//
//  ChartScale.swift
//  
//  Created by Tasuku Maeda
//

import Foundation

protocol ChartScale {
    associatedtype INPUT
    associatedtype OUTPUT
    func domain(_ values: [INPUT]) -> Self
    func range(_ values: [OUTPUT]) -> Self
    func scale(_ value: INPUT) -> OUTPUT?
    func invert(_ value: OUTPUT) -> INPUT?
}
