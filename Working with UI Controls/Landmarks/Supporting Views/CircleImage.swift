/*
  CircleImage.swift
  SwiftUI Essentials: Handling User Input
  A view that clips an image to a circle and adds a stroke and shadow.
*/

import SwiftUI

struct CircleImage: View {
    // Add a stored image property to CircleImage.
    var image: Image

    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        // Update the preview provider to pass the image of Turtle Rock.
        CircleImage(image: Image("turtlerock"))
    }
}
