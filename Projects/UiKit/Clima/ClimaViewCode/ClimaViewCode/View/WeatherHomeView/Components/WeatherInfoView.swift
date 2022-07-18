//
//  WeatherInfoView.swift
//  ClimaViewCode
//
//  Created by Joao Victor on 17/07/22.
//

import UIKit


class WeatherInfoView: UIView {
    init() {
        super.init(frame: .zero)
        
        buildAllViews()
        buildAllConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var uiStackWeatherInfo: UIStackView = {
        let view = UIStackView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis                                      = .vertical
        view.alignment                                 = .trailing
        view.distribution                              = .fill
        view.spacing                                   = 40
        
        return view
    }()
    
    
    lazy var uiIconImageView: UIImageView = {
        let view = UIImageView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image                                     = UIImage(systemName: "cloud.fog")
        view.tintColor                                 = .white
        
        return view
    }()
    
    lazy var uiStackTemperature: UIStackView = {
        let view = UIStackView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis                                      = .horizontal
        view.distribution                              = .fill
        
        return view
    }()
    
    lazy var uiLabelTemperature: UILabel = {
        let view = UILabel()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text                                      = "25.1"
        view.font                                      = view.font.withSize(80)
        view.textColor                                 = .white
        
        
        return view
    }()
    
    lazy var uiLabelPoint: UILabel = {
        let view = UILabel()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text                                      = "°"
        view.font                                      = view.font.withSize(80)
        view.textColor                                 = .white
        
        
        return view
    }()
    
    lazy var uiLabelCelsius: UILabel = {
        let view = UILabel()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font                                      = view.font.withSize(80)
        view.textColor                                 = .white
        view.text                                      = "C"
        
        return view
    }()
    
    lazy var uiLabelNameCity: UILabel = {
        let view = UILabel()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text                                      = "London"
        view.textColor                                 = .white
        view.font                                      = view.font.withSize(30)
        
        return view
    }()
    
}


// MARK: - BuildAllViews
extension WeatherInfoView {
    func buildAllViews() {
        addSubview(uiStackWeatherInfo)
        
        
        uiStackWeatherInfo.addArrangedSubview(uiIconImageView)
        uiStackWeatherInfo.addArrangedSubview(uiStackTemperature)
        uiStackWeatherInfo.addArrangedSubview(uiLabelNameCity)
        
        uiStackTemperature.addArrangedSubview(uiLabelTemperature)
        uiStackTemperature.addArrangedSubview(uiLabelPoint)
        uiStackTemperature.addArrangedSubview(uiLabelCelsius)
    }
}

// MARK: - BuildAllConstraints
extension WeatherInfoView {
    func buildAllConstraints() {
        buildStackWeatherInfoConstraints()
        
        buildIconImageViewConstraints()
    }
    
    func buildStackWeatherInfoConstraints() {
        NSLayoutConstraint.activate([
            uiStackWeatherInfo.topAnchor.constraint(equalTo: topAnchor),
            uiStackWeatherInfo.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    
    
    
    func  buildIconImageViewConstraints() {
        NSLayoutConstraint.activate([
            uiIconImageView.widthAnchor.constraint(equalToConstant: 120),
            uiIconImageView.heightAnchor.constraint(equalToConstant: 120)
            
        ])
    }
}
