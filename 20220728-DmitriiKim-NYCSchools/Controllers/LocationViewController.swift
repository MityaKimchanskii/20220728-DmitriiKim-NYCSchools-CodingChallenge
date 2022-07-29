//
//  LocationViewController.swift
//  20220728-DmitriiKim-NYCSchools
//
//  Created by Mitya Kim on 7/28/22.
//

import UIKit
import MapKit
import CoreLocation

class LocationViewController: UIViewController {
    
    // MARK: - Properties
    var school: School?
    var latitude: Double?
    var longitude: Double?
    
    // MARK: - Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getCoordinate()
        showLocation()
    }
    
    // MARK: - Helper Methods
    func getCoordinate() {
        guard let school = school,
        let latitudeString = school.latitude,
        let longitudeString = school.longitude
        else { return }
        
        latitude = Double(latitudeString) ?? 0.0
        longitude = Double(longitudeString) ?? 0.0
        
    }
    
    func showLocation() {
        guard let school = school, let latitude = latitude, let longitude = longitude else { return }
        let location = CLLocation(latitude: latitude, longitude: longitude)
        let annotation = Annotation(title: school.name, locationName: school.address, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        mapView.centerToLocation(location)
        mapView.addAnnotation(annotation)
    }
}


