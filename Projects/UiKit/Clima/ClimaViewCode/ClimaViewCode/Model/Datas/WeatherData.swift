//
//  WeatherData.swift
//  ClimaViewCode
//
//  Created by Joao Victor on 17/07/22.
//

import Foundation

class WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}


class Main: Decodable {
    let temp: Double
}

class Weather: Decodable {
    let id: Int
}
