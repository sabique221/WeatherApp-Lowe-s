//
//  KelvinToFar.swift
//  WeatherApp
//
//  Created by sabique islam on 2/17/21.
//

import Foundation
extension Double {
    func KelvinToFar() -> Double {
        return (self-273.15) * 1.8 + 32 
    }
}
