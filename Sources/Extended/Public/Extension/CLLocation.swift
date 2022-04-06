//
//  CLLocation.swift
//  
//
//  Created by Mohammad Yasir on 06/04/22.
//

import SwiftUI
import CoreLocation

public extension CLLocation {
    static func getCoordinateFor(
        place name: String,
        completion: @escaping (CLLocation?, Error?) -> Void
    ) -> Void {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(name) { placemarks, error in
            
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let placemark = placemarks?[0] else {
                completion(nil, error)
                return
            }
            
            guard let location = placemark.location else {
                completion(nil, error)
                return
            }
            
            completion(location, nil)
        }
    }
}
