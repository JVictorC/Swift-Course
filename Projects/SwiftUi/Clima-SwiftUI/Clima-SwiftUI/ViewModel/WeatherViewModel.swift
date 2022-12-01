//
//  WeatherViewModal.swift
//  Clima-SwiftUI
//
//  Created by Joao Victor on 24/07/22.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weatherModel: WeatherModel = WeatherModel(id: 0, nameCity: "", weatherCelsius: 0)
    
    
    private let urlBase = "https://api.openweathermap.org/data/2.5/weather?appid=344540684f9db6f19120a1d2be3b28c4&units=metric"
    
    var isLoadingData = true
    
    private var clietHttp: ClientHttp
    
    init(clientHttp: ClientHttp) {
        self.clietHttp = clientHttp
    }
    

    
    func requestbyNameCity(with: String) {
        let urlString = "\(urlBase)&q=\(with)"
        
        isLoadingData = true
        
        requestData(with: urlString)
    }
    
    func requestByCordinates(with: Cordinate) {
        let urlString = "\(urlBase)&lat=\(with.lat)&lon=\(with.lon)"
        
        isLoadingData = true
        
        requestData(with: urlString)
    }
    
    
    private func requestData(with urlString: String) {
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            if error != nil { print(error!) }
            
            guard let data = data else { return }
            
             guard let safeWeatherModel = self.decoderWeatherData(with: data) else {return}
            
            
            DispatchQueue.main.async {
                self.weatherModel = safeWeatherModel
                self.isLoadingData = false
            }
        
        }
        
        task.resume()
    }
    
    func decoderWeatherData(with data: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let weatherDataConvert = try decoder.decode(WeatherDataConvert.self, from: data)
            
            
            let weatherModel = WeatherModel(
                id: weatherDataConvert.weather[0].id,
                nameCity: weatherDataConvert.name,
                weatherCelsius: weatherDataConvert.main.temp
            )
            
            return weatherModel
        } catch {
            print(error)
        }
        
        return nil
    }
    
}
