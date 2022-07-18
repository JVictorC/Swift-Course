//
//  WeatherHomeVIew.swift
//  ClimaViewCode
//
//  Created by Joao Victor on 15/07/22.
//

import UIKit

// MARK: - WeatherHomeView
class WeatherHomeView: UIView {
    init() {
        super.init(frame: .zero)
        
        buildAllViews()
        buildAllConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIS
    
    lazy var uiBackGroundImage: UIImageView = {
        let view = UIImageView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image                                     = UIImage(named: "background")
        view.contentMode                               = .scaleAspectFill
        
        
        return view
    }()
    
    public lazy var uiHeaderSearchView: HeaerSearchView = {
        let view = HeaerSearchView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var uiWeatherInfoView: WeatherInfoView = {
        let view = WeatherInfoView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
}

// MARK: - BuildAllViews
extension WeatherHomeView {
    func buildAllViews() {
        addSubview(uiBackGroundImage)
        addSubview(uiHeaderSearchView)
        addSubview(uiWeatherInfoView)
    }
}

// MARK: - BuildAllConstraints

extension WeatherHomeView {
    func buildAllConstraints() {
        buildBackGroundImageConstraints()
        buildHeaderSearchViewConstraints()
        buildWeatherInfoViewConstraints()
    }
    
    func buildWeatherInfoViewConstraints() {
        NSLayoutConstraint.activate([
            uiWeatherInfoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            uiWeatherInfoView.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -10),
            uiWeatherInfoView.topAnchor.constraint(equalTo: uiHeaderSearchView.bottomAnchor, constant: 30),
            uiWeatherInfoView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func buildBackGroundImageConstraints() {
        NSLayoutConstraint.activate([
            uiBackGroundImage.topAnchor.constraint(equalTo: topAnchor),
            uiBackGroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            uiBackGroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            uiBackGroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func buildHeaderSearchViewConstraints() {
        NSLayoutConstraint.activate([
            uiHeaderSearchView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            uiHeaderSearchView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            uiHeaderSearchView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            uiHeaderSearchView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
