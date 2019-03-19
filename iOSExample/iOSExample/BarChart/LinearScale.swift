//
//  LinearScale.swift
//  
//  Created by Tasuku Maeda
//

import Foundation

class LinearScale: ChartScale {
    typealias INPUT = Double
    typealias OUTPUT = Double
    
    private var domain0: Double?
    private var domain1: Double?
    private var range0: Double?
    private var range1: Double?
    
    init() {
        
    }
    
    @discardableResult
    func domain(_ values: [Double]) -> Self {
        if values.count < 2 {
            assertionFailure("domain values count must be >= 2")
        }
        domain0 = values[0]
        domain1 = values[values.count - 1]
        return self
    }
    
    @discardableResult
    func range(_ values: [Double]) -> Self {
        if values.count < 2 {
            assertionFailure("range values count must be >= 2")
        }
        range0 = values[0]
        range1 = values[values.count - 1]
        return self
    }
    
    func scale(_ value: Double) -> Double? {
        guard let domain0 = domain0,
            let domain1 = domain1,
            let range0 = range0,
            let range1 = range1 else { return nil }
        // y = ax + b
        // a = diffRange / diffDomain
        // b = y - ax
        let diffRange = range1 - range0
        let diffDomain = domain1 - domain0
        if diffDomain == 0 {
            return nil
        }
        let a = diffRange / diffDomain
        let b = range0 - a * domain0
        return a * value + b
    }
    
    func invert(_ value: Double) -> Double? {
        guard let domain0 = domain0,
            let domain1 = domain1,
            let range0 = range0,
            let range1 = range1 else { return nil }
        // y = ax + b
        // a = diffRange / diffDomain
        // b = y - ax
        // x = (y - b) / a -> a != 0
        let diffRange = range1 - range0
        let diffDomain = domain1 - domain0
        if diffDomain == 0 {
            return nil
        }
        let a = diffRange / diffDomain
        let b = range0 - a * domain0
        if a == 0 {
            return nil
        }
        return (value - b) / a
    }
}
