//
//  WeatherDataConvert.swift
//  Clima-SwiftUI
//
//  Created by Joao Victor on 24/07/22.
//

import Foundation


struct WeatherDataConvert: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Weather: Decodable {
    let id: Int
}

struct Main: Decodable {
    let temp: Double
}
