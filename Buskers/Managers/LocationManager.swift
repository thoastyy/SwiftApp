//
//  LocationManager.swift
//  Buskers
//
//  Created by I3LT-020 on 7/9/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    // Creating an instance of CLLocationManager, the framework we use to get the coordinates
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        
        // Assigning a delegate to our CLLocationManager instance
        manager.delegate = self
    }
    
    func requestLocation() {
            isLoading = true
            manager.requestLocation()
        }
        
        // Set the location coordinates to the location variable
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            location = locations.first?.coordinate
            isLoading = false
        }
        
        
        // This function will be called if we run into an error
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Error getting location", error)
            isLoading = false
        }
    }
