//
//  WeatherManagerModel.swift
//  Clima
//
//  Created by Joao Victor on 04/07/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation


protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManagerModel, with weather: WeatherModel)
    func didFailWithError(with error: Error)
}

struct WeatherManagerModel {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=344540684f9db6f19120a1d2be3b28c4&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeatherCordinates(with cordinates: Cordinates) {
        let urlString = "\(weatherURL)&lat=\(cordinates.lat)&lon=\(cordinates.lon)"
        performRequest(with: urlString)
    }
    
    func fetchWeatherName(with cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        // Create a URL
        if let url = URL(string: urlString) {
            // Create a URLSession
            let session = URLSession(configuration: .default)
            
            // Give the session a task
            let task = session.dataTask(with: url) { data, reponse, error in
                // nil e a ausencia de um valor
                if error != nil {
                    delegate?.didFailWithError(with: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = parseJSON(with: safeData) {
                        delegate?.didUpdateWeather(self,with: weather)
                    }
                    
                }
            }
            
            // Start The Task
            task.resume()
        }
    }
    
    func parseJSON(with weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let cityName = decodedData.name
            
            let weatherModal = WeatherModel(
                conditionId: id ?? 0,
                cityName: cityName ?? "",
                temperature: temp ?? 0
            )
            
            return weatherModal
        } catch {
            delegate?.didFailWithError(with: error)
        }
        return nil
    }
}
