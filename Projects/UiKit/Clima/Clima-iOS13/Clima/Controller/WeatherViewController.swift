//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

// MARK: - WeatherViewController

class WeatherViewController: UIViewController {
    
    var weatherMangerModel = WeatherManagerModel()
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchtextField: UITextField!
    @IBOutlet weak var dataStackView: UIStackView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        // Solicitando Permissao para localizacao User
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        
        searchtextField.delegate = self
        weatherMangerModel.delegate = self
    }
}

// MARK:  - CLLocationManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate {
    
    @IBAction func getLocationByCordenates(_ sender: Any) {
        self.dataStackView.isHidden = true
        locationManager.requestLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.last {
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            
            self.weatherMangerModel.fetchWeatherCordinates(with: Cordinates(
                lat: String(lat),
                lon: String(lon)
            ))
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
// MARK:  - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManagerModel, with weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
            
            self.dataStackView.isHidden = false
        }
        
    }
    
    func didFailWithError(with error: Error) {
        print(error)
    }
}

// MARK:  - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed() {
        let isValid = self.textFieldShouldEndEditing(searchtextField)
        if !isValid {return}
        
        let city = searchtextField.text
        self.dataStackView.isHidden = true
        
        weatherMangerModel.fetchWeatherName(with: city!)
        
        // Responsavel por minizar o keyBoard
        searchtextField.endEditing(true)
    }
    
    
    // Esse campo seria o Ok do KeyBoard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.searchPressed()
        return true
    }
    
    // Seria quando finalizar de preencher o app
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchtextField.text = ""
    }
    
    // Esse metodo vamos usar como o validation do textField
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if(textField.text?.isEmpty ?? true) {
            textField.placeholder = "Digite Algo"
        }
        
        return true
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

