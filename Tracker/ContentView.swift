//
//  ContentView.swift
//  Tracker
//
//  Created by Riku Kuisma on 15.10.2023.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var latitudeText = ""
    @State private var longitudeText = ""
    @State private var cameraPosition: MapCameraPosition = .region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    ))

    /*func converter(text: String) -> String {
           let textDouble = Double(latitudeText.replacingOccurrences(of: ",", with: ".")) ?? 0
           // If the Textfield is empty, 0 will be returned
           return String(format: "%.2f", textDouble)
       }*/
    
    
    var body: some View {
        ZStack {
            
            Map(position: $cameraPosition)
            
            TextField("Latitude", text: $latitudeText)
                .keyboardType(.default)
                .padding(.leading,  140.0)
                .padding(.bottom, 390)
            
            
            TextField("Longitude", text: $longitudeText)
                .keyboardType(.default)
                .padding(.leading,  140.0)
                .padding(.bottom, 290)
            
            
            
            Button("Update Map") {
                if let latitude = Double(latitudeText),
                   let longitude = Double(longitudeText) {
                    cameraPosition = .region(MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
                        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
                    ))
                }
            }
        }
    }
}





#Preview {
    ContentView()
}

