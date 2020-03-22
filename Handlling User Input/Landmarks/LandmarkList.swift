//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Jeff Holmes on 3/20/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    // Add a state property with its initial value set to false.
    // @State var showFavoritesOnly = false
    
    // Replace the showFavoritesOnly declaration with an @EnvironmentObject property
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        // Replace the default Text view with a List, and provide LandmarkRow instances
        // with the first two landmarks as the list’s children.
        
        // Embed the dynamically generated list of landmarks in a NavigationView.
        NavigationView {
            List {
                // Add a Toggle view as the first child of the List view, 
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }

                // Create a nested ForEach group to transform the landmarks into rows.
                ForEach(userData.landmarks) { landmark in
                    // Filter the list of landmarks by checking the showFavoritesOnly
                    // property and each landmark.isFavorite value.
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        // Wrap the returned row in a NavigationLink, specifying the LandmarkDetail view as the destination.
                        // Pass the current landmark to the destination LandmarkDetail.
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            // Complete the dynamically-generated list by returning a LandmarkRow from the closure.
                            // This creates one LandmarkRow for each element in the landmarkData array.
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            // Call the modifier method to set the title of the
            // navigation bar when displaying the list.
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        // Embed the LandmarkList in a ForEach instance using an array of device names as the data.
        ForEach(["iPhone SE", "iPhone XS Max", "iPhone 11", "iPhone 11 Pro"], id: \.self) { deviceName in
            LandmarkList()
                .environmentObject(UserData())
                // Change the current list preview to render at the size of an iPhone SE.
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                // Use the modifier to add the device names as labels for the previews.
                .previewDisplayName(deviceName)
        }
    }
}
