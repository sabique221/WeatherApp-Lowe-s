//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by sabique islam on 2/19/21.
//

import XCTest
@testable import WeatherApp

class WeatherUnitAppTests: XCTestCase {
    
    let vc = WeatherViewController.init(city: "Dallas", ViewModel: MockWeatherViewModel.init(false)) //set to true to generate failure to access data
    
    func test_view_model(){
        
        let expecation = self.expectation(description: "JSON response from file was successful")
        
        vc.ViewModel!.getAllWeatherData(city: "new york") { result in
            
            switch result {
            case .success(let list):
            XCTAssertNotNil(list)
            case .failure(let error):
                XCTFail(error.rawValue)
            }
            expecation.fulfill()
        }
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
}
