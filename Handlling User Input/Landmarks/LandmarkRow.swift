//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Jeff Holmes on 3/20/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    // Add landmark as a stored property of LandmarkRow.
    var landmark: Landmark
    
    var body: some View {
        // Embed the existing text view in an HStack.
        HStack {
            // Complete the row by adding an image before the text view and a spacer after it.
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)

            // Modify the text view to use the landmark property’s name.
            Text(landmark.name)

            Spacer()
            
            // Add a star image inside an if statement to test whether the current landmark is a favorite.
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        // You can use a Group to return multiple previews from a preview provider.
        Group {
            LandmarkRow(landmark: landmarkData[0])
            LandmarkRow(landmark: landmarkData[1])
        }
        // Use the modifier to set a size that approximates a row in a list.
        // To simplify the code, move the previewLayout(_:) call to the outside of the
        // group’s child declarations.
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

