//
//  LocationService.swift
//  EatMe
//
//  Created by Юрий Альт on 03.07.2023.
//

import CoreLocation

final class LocationService: NSObject, ObservableObject {
    let locationManager = CLLocationManager()
    @Published var currentCity: String = ""
    
    func getLocation() {
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            guard let self = self, let placemark = placemarks?.first else { return }
            self.currentCity = placemark.locality ?? ""
            self.locationManager.stopUpdatingLocation()
        }
    }
}
