//
//  ViewModelProtocol.swift
//  WeatherApp
//
//  Created by sabique islam on 2/19/21.
//

import Foundation
import UIKit

protocol WeatherViewModelProtocol {
    func getAllWeatherData<T: Codable>(city: String, forModel model: T.Type, comp: @escaping (Result<T,HTTPError>)-> Void)
}
