//
//  Mock WeatherViewModel.swift
//  WeatherAppTests
//
//  Created by sabique islam on 2/21/21.
//

import Foundation
@testable import WeatherApp

class MockWeatherViewModel: WeatherViewModelProtocol {

    var shouldReturnError = true
    var viewModelWasCalled = true
    
    func reset(){
        shouldReturnError = false
        viewModelWasCalled = false
    }
    
    init(_ shouldReturnError: Bool){
        self.shouldReturnError = shouldReturnError
    }
    
    convenience init(){
        self.init(false)
        
    }
    
    func getAllWeatherData(city: String, comp: @escaping (Result<[List], HTTPError>) -> Void) {
        viewModelWasCalled = true
        
        if  shouldReturnError {
            comp(.failure(.internalServerError))
        }
        
        let bundle = Bundle(for: type(of: self))
        
        guard let fileUrl = bundle.url(forResource: city.lowercased().replacingOccurrences(of: " ", with: "+").replacingOccurrences(of: ".", with: ""), withExtension: "json") else{
            comp(.failure(.cityNotFound))
            return
        }
            let data = try! Data(contentsOf: fileUrl)
        
        
        do{
            let jsonData = try JSONDecoder().decode(WeatherModel.self, from: data)
            comp(.success(jsonData.list))
        } catch {
            comp(.failure(.invalidData))
        }
    }
}
