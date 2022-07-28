//
//  WeatherInfo.swift
//  Clima-SwiftUI
//
//  Created by Joao Victor on 24/07/22.
//

import SwiftUI

struct WeatherInfo: View {
    let weatherImageIcon: String
    let weathreCelsius: String
    let weatherNameCity: String
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Spacer()
                    .frame(height: 20)
                
                Image(systemName: weatherImageIcon)
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 130, height: 130)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                
                HStack {
                    Text(weathreCelsius)
                        .foregroundColor(.white)
                        .font(.system(size: 55))
                    Text("°")
                        .foregroundColor(.white)
                        .font(.system(size: 55))
                    Text("C")
                        .foregroundColor(.white)
                        .font(.system(size: 55))
                }
                
                Spacer()
                    .frame(height: 30)
                
                Text(weatherNameCity)
                    .foregroundColor(.white)
                    .font(.system(size: 35))
                    .frame(maxWidth: .infinity)
                
                Spacer()
            }
            .frame(maxWidth: 200)
            .padding(.horizontal, 20)
        }
        .frame(
            maxWidth: UIScreen.uiWidthScreen
        )
    }
}

struct WeatherInfo_Preview: PreviewProvider {
    static var previews: some View {
        WeatherInfo(
            weatherImageIcon: "",
            weathreCelsius: "",
            weatherNameCity: ""
        )
            .previewLayout(.sizeThatFits)
            .background(.black)
    }
}
