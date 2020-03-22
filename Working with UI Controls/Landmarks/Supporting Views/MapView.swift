/*
  MapView.swift
  SwiftUI Essentials: Handling User Input
  A view that hosts an MKMapView.
*/

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    // Add a coordinate property to MapView and convert the code to use that property
    // instead of hard-coding the latitude and longitude.
    var coordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        // Update the preview provider to pass the coordinate of the first landmark in the data array.
        MapView(coordinate: landmarkData[0].locationCoordinate)
    }
}
