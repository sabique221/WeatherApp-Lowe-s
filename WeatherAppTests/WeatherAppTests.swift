//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by sabique islam on 2/19/21.
//

import XCTest
@testable import WeatherApp

class WeatherUnitAppTests: XCTestCase {
    
    let vc = WeatherViewController.init(city: "new york", ViewModel: MockWeatherViewModel.init(false)) //set to true to generate failure to access data
    
    
    func test_view_model(){
        
        vc.ViewModel?.getAllWeatherData(city: vc.city!, forModel: WeatherModel.self) {(result) in
                
                switch result {
                case .success(let list):
                XCTAssertNotNil(list)
                case .failure(let error):
                    XCTFail(error.rawValue)
                }
    
            }
        }
}


