//
//  ContentView.swift
//  Landmarks
//  Created by Jeff Holmes on 3/20/20.
//  Copyright © 2020 Jeff Holmes. All rights reserved.
//

import SwiftUI

//  By default, SwiftUI view files declare two structures.
// The first structure conforms to the View protocol and describes the view’s content and layout.
// The second structure declares a preview for that view.

struct ContentView: View {
    var body: some View {
        // Embed a VStack that holds the three text views in another VStack.
        VStack {
            // Add your custom MapView to the top of the stack.
            // When you specify only the height parameter, the view automatically
            // sizes to the width of its content. In this case, MapView expands to
            // fill the available space.
            MapView()
                // Allow the map content to extend to the top edge of the screen
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)

            // Add the CircleImage view to the stack.
            // To layer the image view on top of the map view, give the image
            // an offset of -130 points vertically, and padding of -130 points
            // from the bottom of the view.
            // These adjustments make room for the text by moving the image upwards.
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text(/*@START_MENU_TOKEN@*/"Joshua Tree National Park"/*@END_MENU_TOKEN@*/)
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
            }
            .padding()
            
            // Add a spacer at the bottom of the outer VStack to push the content to the top of the screen.
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
