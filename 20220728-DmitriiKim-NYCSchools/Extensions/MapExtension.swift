//
//  MapExtension.swift
//  20220728-DmitriiKim-NYCSchools
//
//  Created by Mitya Kim on 7/28/22.
//

import Foundation
import MapKit

extension MKMapView {
    func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}
