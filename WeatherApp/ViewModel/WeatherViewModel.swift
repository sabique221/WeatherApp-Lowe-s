//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by sabique islam on 2/16/21.
//
import UIKit
import Foundation
class WeatherViewModel: WeatherViewModelProtocol {
    

    
    func getAllWeatherData<T: Codable>(city: String, forModel model: T.Type, comp: @escaping (Result<T,HTTPError>)-> Void) {
        
        guard let apiURL = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=" + "\(city)" + "&appid=65d00499677e59496ca2f318eb68c049") else {
            comp(.failure(.invalidResponse))
            return
        }
        DispatchQueue.global(qos: .utility).async {
        URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            
            if let _ = error {
                comp(.failure(.unableToComplete))
                return
            }
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 404:
                    comp(.failure(.cityNotFound))
                case 401: 
                    comp(.failure(.invalidResponse))
                case 500...511 :
                    comp(.failure(.internalServerError))
                default:
                    guard let data = data else {
                        comp(.failure(.invalidData))
                        return
                    }
                    do {
                        let weatherResponse = try JSONDecoder().decode(T.self, from: data)
                        comp(.success(weatherResponse))
                        
                        
                    }catch {
                        comp(.failure(.unableToComplete))
                    }
                }
            }
        }.resume()
    }
}
}
