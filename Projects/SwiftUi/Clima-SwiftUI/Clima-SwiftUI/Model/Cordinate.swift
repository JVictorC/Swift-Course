//
//  Cordinate.swift
//  Clima-SwiftUI
//
//  Created by Joao Victor on 28/07/22.
//

import Foundation
import CoreLocation

struct Cordinate {
    let lat: String
    let lon: String
    
    
    init(lat: CLLocationDegrees, lon: CLLocationDegrees) {
        self.lat = String(lat)
        
        self.lon = String(lon)
    }
    
}
