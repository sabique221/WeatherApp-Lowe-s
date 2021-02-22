//
//  HTTPError.swift
//  WeatherApp
//
//  Created by sabique islam on 2/17/21.
//

import Foundation

enum HTTPError: String, Error {
    
    case unableToComplete = "Unable to complete your request. Please Check you internet connection with the server."
    case invalidResponse = "Invalid API key. Please see http://openweathermap.org/faq#error401 for more info."
    case invalidData = "The data revieved from the server was invalid. Please try again."
    case cityNotFound = "The city you are searching for was not found. Please try again with a different city."
    case internalServerError = "The server has encountered a situation it doesn't know how to handle."
}
