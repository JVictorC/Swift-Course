//
//  ViewController.swift
//  ClimaViewCode
//
//  Created by Joao Victor on 15/07/22.
//

import UIKit
import CoreLocation

class WeatherHomeViewController: UIViewController {
    
    var weatherHomeView: WeatherHomeView?
    var weatherManagerModel = WeatherManagerModel()
    var coreLocation: CLLocationManager?

    var uiButtonSearch: UIButton?
    var uiButtonSearchByLocation: UIButton?
    var uiSearchCityTextField: UITextField?
    
    var uiLabelTemperature: UILabel?
    var uiLabelNameCity: UILabel?
    var uiIconImageView: UIImageView?
    
    override func loadView() {
        super.loadView()
        
        weatherHomeView = WeatherHomeView()
        coreLocation = CLLocationManager()
        
        uiButtonSearch = weatherHomeView?.uiHeaderSearchView.uiButtonSearch
        uiButtonSearchByLocation = weatherHomeView?.uiHeaderSearchView.uiButtonSearchByLocation
        uiSearchCityTextField = weatherHomeView?.uiHeaderSearchView.uiSearchCityTextField
        
        
        uiLabelTemperature = weatherHomeView?.uiWeatherInfoView.uiLabelTemperature
        uiLabelNameCity = weatherHomeView?.uiWeatherInfoView.uiLabelNameCity
        uiIconImageView = weatherHomeView?.uiWeatherInfoView.uiIconImageView
        
        uiSearchCityTextField?.delegate = self
        weatherManagerModel.delegate = self
        coreLocation?.delegate = self
        

        coreLocation?.requestWhenInUseAuthorization()
        
        coreLocation?.requestLocation()
        
        self.view = weatherHomeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherHomeView?.uiWeatherInfoView.isHidden = true
        
        uiButtonSearch?.addTarget(self, action: #selector(handleSearchByCityName), for: .touchUpInside)
        uiButtonSearchByLocation?.addTarget(self, action: #selector(handleSearchByLocation), for: .touchUpInside)
    }
}

extension WeatherHomeViewController:CLLocationManagerDelegate {
    @objc func handleSearchByLocation() {
        coreLocation?.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            manager.requestLocation()
        } else if status == .denied {
            DispatchQueue.main.async {
                self.showToast(message: "Precisamos da sua localizaçao", font: .systemFont(ofSize: 10))
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        showToast(message: "Carregando...", font: .systemFont(ofSize: 20))
        let lat = locations.last?.coordinate.latitude
        let lon = locations.last?.coordinate.longitude
        
        let codinatesModel = CordinatesModel(lat: String(lat!), lon: String(lon!))
        
        weatherManagerModel.getWeatherInfoByCordiantes(with: codinatesModel)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
}


extension WeatherHomeViewController: UITextFieldDelegate {
    
    @objc func handleSearchByCityName() {
        weatherHomeView?.uiWeatherInfoView.isHidden = true
        showToast(message: "Carregando...", font: .systemFont(ofSize: 20))
        
        if let cityName = uiSearchCityTextField?.text {
            weatherManagerModel.getWeatherInfoByCityName(with: cityName)
        }

        uiSearchCityTextField?.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.handleSearchByCityName()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        uiSearchCityTextField?.text = ""
    }
}

extension WeatherHomeViewController: WeatherManagerDelegate {
    func requestSucces(with weatherModel: WeatherModel) {
        DispatchQueue.main.async {
            self.weatherHomeView?.uiWeatherInfoView.isHidden = false
            
            self.uiLabelNameCity?.text = weatherModel.cityName
            self.uiLabelTemperature?.text = weatherModel.temperatureString
            self.uiIconImageView?.image = UIImage(systemName: weatherModel.conditionString)
        }
    }
    
    func requestError(with error: Error) {
        DispatchQueue.main.async {
            self.showToast(message: "Ocorreu um erro", font: .systemFont(ofSize: 20))
        }
    }
}

extension UIViewController {

func showToast(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }
