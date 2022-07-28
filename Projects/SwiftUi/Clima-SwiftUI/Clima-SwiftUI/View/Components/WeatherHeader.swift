//
//  WeatherHEader.swift
//  Clima-SwiftUI
//
//  Created by Joao Victor on 24/07/22.
//

import SwiftUI


protocol WeatherHeaderHandlesDelegate {
    func handleSearchByName(_ cityName: String)
    func handleSearchByLocation(_ location: String)
}


struct WetherHeader: View {
    @State var weatherNameCity: String
    
    let delegate: WeatherHeaderHandlesDelegate?
    
    var body: some View {
        HStack {
            Button(action: { delegate?.handleSearchByLocation("") } ) {
                Image(systemName: "location.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .foregroundColor(.white)
            }.frame(width: 60, alignment: .leading)
            
            RoundedRectangle(cornerRadius: 5)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .foregroundColor(.gray.opacity(0.2))
                .cornerRadius(10)
                .overlay {
                    TextField("Cidade", text: $weatherNameCity)
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: 50,
                            alignment: .center
                        )
                        .onSubmit {
                            delegate?.handleSearchByName(weatherNameCity)
                            
                            self.weatherNameCity = ""
                        }
                        .padding(.horizontal)
                        .background(.gray.opacity(0.5))
                        .cornerRadius(5)
                }
            
            
            
            
            Button(action: {
                delegate?.handleSearchByName(weatherNameCity)
                self.weatherNameCity = ""
            } ) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .foregroundColor(.white)
            }.frame(width: 60, alignment: .leading)
        }
        .frame(width: UIScreen.uiWidthScreen)
        .padding(.horizontal)
    }
}


struct WetherHeader_Preview: PreviewProvider {
    static var previews: some View {
        WetherHeader(weatherNameCity: "", delegate: nil)
            .previewLayout(.sizeThatFits)
            .background(.black)
    }
}
