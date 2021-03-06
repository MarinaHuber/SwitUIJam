//
//  LocationModel.swift
//  SwiftUIJam
//
//  Created by Marina on 05.11.2021.
//

import Foundation
import MapKit

struct PinLocation: Codable, Identifiable {
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    //Computed Property
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
