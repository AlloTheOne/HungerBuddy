//
//  contentview5.swift
//  Crew
//
//  Created by Dina Alhajj Ibrahim on 17/02/2023.
//

import SwiftUI
import Firebase
import CoreLocation
import MapKit

struct ContentView5: View {
    @StateObject var locationDataManager = LocationDataManager()
    @EnvironmentObject var sessionService: SessionServiceImpl
//    @ObservedObject var obs = observer()
    var body: some View {
        VStack {
            
            // mapView()
            switch locationDataManager.locationManager.authorizationStatus {
            case .authorizedWhenInUse:  // Location services are available.
                // Insert code here of what should happen when Location services are authorized
                Text("Your current location is: \(sessionService.userDetails?.name ?? " ")")
//                Text("\(self.obs.data["data"])")
                Text("Latitude: \(locationDataManager.locationManager.location?.coordinate.latitude.description ?? "Error loading")")
                Text("Longitude: \(locationDataManager.locationManager.location?.coordinate.longitude.description ?? "Error loading")")
                
            case .restricted, .denied:  // Location services currently unavailable.
                // Insert code here of what should happen when Location services are NOT authorized
                Text("Current location data was restricted or denied.")
            case .notDetermined:        // Authorization not determined yet.
                Text("Finding your location...")
                ProgressView()
            default:
                ProgressView()
            }
        }
    }
}
struct contentview5_Previews: PreviewProvider {
    static var previews: some View {
        ContentView5()
    }
}


