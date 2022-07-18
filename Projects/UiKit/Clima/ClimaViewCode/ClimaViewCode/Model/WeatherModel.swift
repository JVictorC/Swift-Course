//
//  WeatherModel.swift
//  ClimaViewCode
//
//  Created by Joao Victor on 17/07/22.
//

import Foundation

struct WeatherModel {
    let cityName: String
    let temperature: Double
    let id: Int
    
    var temperatureString: String {
         String(format: "%.1f", temperature)
    }
    
    var conditionString: String {
        switch id {
            case 200...232:
                return "cloud.bolt"
                
            case 300...321:
                return "cloud.drizzle"
                
            case 500...531:
                return "cloud.rain"
                
            case 600...622:
                return "cloud.snow"
                
            case 701...781:
                return "cloud.fog"
                
            case 800:
                return "cloud.bolt"
                
            case 801...804:
                return "cloud.bolt"
                
            default:
                return "cloud"
            }
    }
    
    
    
}
