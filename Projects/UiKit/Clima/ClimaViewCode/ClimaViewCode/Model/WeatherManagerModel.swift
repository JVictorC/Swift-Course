//
//  WeatherManagerModel.swift
//  ClimaViewCode
//
//  Created by Joao Victor on 17/07/22.
//

import Foundation

protocol WeatherManagerDelegate {
    func requestSucces(with weatherModel: WeatherModel)
    
    func requestError(with error: Error)
}

class WeatherManagerModel {
    private let url = "https://api.openweathermap.org/data/2.5/weather?appid=344540684f9db6f19120a1d2be3b28c4&units=metric"
    
    
    func getWeatherInfoByCordiantes(with cordinates: CordinatesModel) {
        let urlString = "\(url)&lat=\(cordinates.lat)&lon=\(cordinates.lon)"
        
        performWeatherRequest(with: urlString)
    }
    
    func getWeatherInfoByCityName(with: String) {
        let urlString = "\(url)&q=\(with)"
       performWeatherRequest(with: urlString)
    }
    
    var delegate: WeatherManagerDelegate?
    
    private func performWeatherRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default)
            
            let task = urlSession.dataTask(with: url) { [self] data, response, error in
                if (error != nil) {
                    delegate?.requestError(with: error!)
                }
                
                if let safeData = data {
                    if let weatherData = perfomJSONWeatherData(with: safeData) {
                        
                        let weatherModel = WeatherModel(
                            cityName: weatherData.name,
                            temperature: weatherData.main.temp,
                            id: weatherData.weather[0].id
                        )
                        
                        
                        delegate?.requestSucces(with: weatherModel)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    private func perfomJSONWeatherData(with data:Data) -> WeatherData? {
        do {
            let decodedData = try JSONDecoder().decode(WeatherData.self, from: data)
            return decodedData
        } catch {
            delegate?.requestError(with: error)
        }
        
        return nil
    }
}
