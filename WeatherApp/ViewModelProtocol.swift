//
//  ViewModelProtocol.swift
//  WeatherApp
//
//  Created by sabique islam on 2/19/21.
//

import Foundation
import UIKit

protocol WeatherViewModelProtocol {
    func getAllWeatherData(city: String, comp: @escaping (Result<[List],HTTPError>)-> Void)
}
