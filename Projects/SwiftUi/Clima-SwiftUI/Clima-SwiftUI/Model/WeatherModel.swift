//
//  WeatherModel.swift
//  Clima-SwiftUI
//
//  Created by Joao Victor on 24/07/22.
//

import Foundation


struct WeatherModel: Identifiable {
    var id: Int
    var weatherNameCity: String
    private var weatherCelsius: Double
    
    init(id: Int, nameCity: String, weatherCelsius: Double) {
        self.id = id
        self.weatherNameCity = nameCity
        self.weatherCelsius = weatherCelsius
    }
    
    var weatherCelsiusString: String { String(format: "%.1f", weatherCelsius) }

    
    var weatherImageIcon: String {
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
