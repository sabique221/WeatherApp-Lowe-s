//
//  RemoveDuplicates.swift
//  WeatherApp
//
//  Created by sabique islam on 2/16/21.
//

import Foundation
extension Array where Element:Equatable {
    func removeDuplicates() -> [Element] {
        var result = [Element]()

        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }

        return result
    }
}
