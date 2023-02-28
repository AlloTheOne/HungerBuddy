//
//  location.swift
//  Crew
//
//  Created by Dina Alhajj Ibrahim on 17/02/2023.
//
import SwiftUI
import Firebase
import FirebaseFirestore
import CoreLocation
//import MapKit

class LocationDataManager : NSObject, ObservableObject, CLLocationManagerDelegate {
    @EnvironmentObject var sessionService: SessionServiceImpl
    var locationManager = CLLocationManager()
    @Published var authorizationStatus: CLAuthorizationStatus?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:  // Location services are available.
            // Insert code here of what should happen when Location services are authorized
            authorizationStatus = .authorizedAlways
            locationManager.requestLocation()
            break
            
        case .restricted:  // Location services currently unavailable.
            // Insert code here of what should happen when Location services are NOT authorized
            authorizationStatus = .restricted
            break
            
        case .denied:  // Location services currently unavailable.
            // Insert code here of what should happen when Location services are NOT authorized
            authorizationStatus = .denied
            break
            
        case .notDetermined:        // Authorization not determined yet.
            authorizationStatus = .notDetermined
            manager.requestAlwaysAuthorization()
            break
            
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        manager.delegate = context.coordinator
        
        manager.startUpdatingLocation()
        let last = locations.last
        let uid = "AlaaHamad"
            //        print(last?.coordinate.latitude)
            //            print("Lat : \(location.coordinate.latitude) \nLng : \(location.coordinate.longitude)")
            let db = Firestore.firestore()
            db.collection("locations").document("sharing").setData(["updates" : [uid : GeoPoint(latitude: (last?.coordinate.latitude)!, longitude: (last?.coordinate.longitude)!)]]) { (err) in
                if err != nil {
                    print((err?.localizedDescription)!)
                    return
                }
                print("success")
            }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error: \(error.localizedDescription)")
    }
    
    func getUserLocation() {
        locationManager.allowsBackgroundLocationUpdates = true
      
    }
}

//
//struct mapView: UIViewRepresentable {
//
//
//    let map = MKMapView()
//    func makUIView(context: UIViewRepresentableContext<mapView>) -> MKMapView {
//        locationManager.delegate = context.coordinator
//        locationManager.startUpdatingLocation()
//        map.showsUserLocation = true
////        locationManager.requestAlwaysAuthorization()
//
//        return map
//    }
//
//
//}

//class observer : ObservableObject {
//    @Published var data = String()
//    
//    init() {
//        let db = Database.database()
//        
//        db.reference().child("users").child(uid).addSnapshotListener { snap, err in
//            if err!= nil {
//                print((err?.localizedDescription)!)
//                return
//            }
//            let username = snap?.get(values) as! String
//            
//            self.data["data"] = username
//        }    }
//}
