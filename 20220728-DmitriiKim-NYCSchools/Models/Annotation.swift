//
//  Annotation.swift
//  20220728-DmitriiKim-NYCSchools
//
//  Created by Mitya Kim on 7/28/22.
//

import Foundation
import MapKit

class Annotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, locationName: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
    }
}
