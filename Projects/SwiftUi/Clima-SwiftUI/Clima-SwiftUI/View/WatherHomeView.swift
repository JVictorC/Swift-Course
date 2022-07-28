//
//  ContentView.swift
//  Clima-SwiftUI
//
//  Created by Joao Victor on 23/07/22.
//

import SwiftUI
import CoreLocation

extension UIScreen {
    static let uiWidthScreen = UIScreen.main.bounds.width
}

struct WeatherHomeView: View {
    @ObservedObject private var weatherViewModel = WeatherViewModel()
    
    @ObservedObject private var locationManager = LocationManager()
        
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                WetherHeader(
                    weatherNameCity: weatherViewModel.weatherModel.weatherNameCity,
                    delegate: self
                )
                
                Spacer()
                    .frame(height: 50)
                
                if(weatherViewModel.isLoadingData == false) {
                    WeatherInfo(
                        weatherImageIcon: weatherViewModel.weatherModel.weatherImageIcon,
                        weathreCelsius: weatherViewModel.weatherModel.weatherCelsiusString,
                        weatherNameCity: weatherViewModel.weatherModel.weatherNameCity
                    )
                }
                Spacer()
            }
            
            
        }
        .onAppear {
            locationManager.requestPermission()
            locationManager.requestLocation()
        }.onReceive(locationManager.$location) { location in
            guard let location = location else {return}
            
            
            weatherViewModel.requestByCordinates(with: Cordinate(
                lat: location.latitude,
                lon: location.longitude
            ))

        }
    }
}


extension WeatherHomeView: WeatherHeaderHandlesDelegate {
    func handleSearchByName(_ cityName: String) {
        weatherViewModel.requestbyNameCity(with: cityName)
    }
    
    func handleSearchByLocation(_ location: String) {
        self.locationManager.requestLocation()
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHomeView()
    }
}
