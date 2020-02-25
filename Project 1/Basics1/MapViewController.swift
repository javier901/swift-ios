//
//  MapViewController.swift
//  Basics1
//
//  Created by Debaleena on 25/02/2020.
//  Copyright © 2020 LIRIS.sampleDemos. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet weak var zoomInButton: UIButton!
    @IBOutlet weak var map: MKMapView!
//    @IBOutlet weak var zoomIn: UIButton!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var allLocations = [MKPointAnnotation]()
        
        let loc = MKPointAnnotation()
        loc.title = "Musée Cinéma et Miniature"
        loc.coordinate = CLLocationCoordinate2D(latitude: 45.762033,
                                                longitude: 4.827878);
        
        let loc2 = MKPointAnnotation()
        loc2.title = "Parc de la Tête d'Or"
        loc2.coordinate = CLLocationCoordinate2D(latitude: 45.777598,
                                                longitude: 4.855257);
        
        let loc3 = MKPointAnnotation()
        loc3.title = "Ancient Theatre of Fourvière"
        loc3.coordinate = CLLocationCoordinate2D(latitude: 45.760186,
                                                 longitude: 4.819479);
        
        let loc4 = MKPointAnnotation()
        loc4.title = "Musée des Confluences"
        loc4.coordinate = CLLocationCoordinate2D(latitude: 45.732628,
                                                 longitude: 4.817712);
        
        let loc5 = MKPointAnnotation()
        loc5.title = "Lyon Part-Dieu Railway station"
        loc5.coordinate = CLLocationCoordinate2D(latitude: 45.760838,
                                                 longitude: 4.861279);
        
        let loc6 = MKPointAnnotation()
        loc6.title = "Lyon Perrache Bus station"
        loc6.coordinate = CLLocationCoordinate2D(latitude: 45.748735,
                                                 longitude: 4.824921);
        
        
        allLocations.append(loc)
        allLocations.append(loc2)
        allLocations.append(loc3)
        allLocations.append(loc4)
        allLocations.append(loc5)
        allLocations.append(loc6)
        
        map.addAnnotations(allLocations as [MKAnnotation])
        map.showAnnotations(map.annotations, animated: true)
        
        // Set user current location
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            map.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
            
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            self.map.setRegion(region, animated: true)
        }
    }
    
    @IBAction func zoomIn(_ sender: Any) {
        let region = MKCoordinateRegion(center: self.map.region.center, span: MKCoordinateSpan(latitudeDelta: map.region.span.latitudeDelta*0.7, longitudeDelta: map.region.span.longitudeDelta*0.7))
        map.setRegion(region, animated: true)
    }

}
