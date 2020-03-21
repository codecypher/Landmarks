//
//  CircleImage.swift
//  Landmarks
//  Create a Custom Image View
//  Created by Jeff Holmes on 3/20/20.
//  Copyright © 2020 Jeff Holmes. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        // Replace the text view with the image of Turtle Rock by using the Image(_:) initializer.
        Image("turtlerock")
        // Add a call to clipShape(Circle()) to apply the circular clipping shape to the image.
        // The Circle type is a shape that you can use as a mask, or as a view by giving the circle a stroke or fill.
         .clipShape(Circle())
        // Create another circle with a gray stroke, and then add it as an overlay to give the image a border.
        // Switch the border color to white.
        .overlay(
            Circle().stroke(Color.white, lineWidth: 4))
        // Add a shadow with a 10 point radius.
        .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
