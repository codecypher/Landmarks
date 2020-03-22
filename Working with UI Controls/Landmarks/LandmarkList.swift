/*
  LandmarkList.swift
  SwiftUI Essentials: Handling User Input
  A view showing a list of landmarks.
*/

import SwiftUI

struct LandmarkList: View {
    // Add a state property with its initial value set to false.
    // @State var showFavoritesOnly = false

    // Replace the showFavoritesOnly declaration with an @EnvironmentObject property
    // This userData property gets its value automatically, as long as the
    // environmentObject(_:) modifier has been applied to a parent.
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        List {
            // Add a Toggle view as the first child of the List view,
            // Replace the uses of showFavoritesOnly by accessing the same property on userData.
            // Just like on @State properties, you can access a binding to a member of the
            // userData object by using the $ prefix.
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Show Favorites Only")
            }
            
            // Create a nested ForEach group to transform the landmarks into rows.
            // Use userData.landmarks as the data when creating the ForEach instance.
            ForEach(userData.landmarks) { landmark in
                // Filter the list of landmarks by checking the showFavoritesOnly
                // property and each landmark.isFavorite value.
                if !self.userData.showFavoritesOnly || landmark.isFavorite {
                    // Wrap the returned row in a NavigationLink, specifying the LandmarkDetail view as the destination.
                    // Pass the current landmark to the destination LandmarkDetail.
                    NavigationLink(
                        destination: LandmarkDetail(landmark: landmark)
                            .environmentObject(self.userData)
                    ) {
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

struct LandmarksList_Previews: PreviewProvider {
    static var previews: some View {
        // Embed the LandmarkList in a ForEach instance using an array of device names as the data.
        ForEach(["iPhone 11", "iPhone 11 Pro", "iPhone 11 Pro Max"], id: \.self) { deviceName in
            NavigationView {
                LandmarkList()
            }
            // Change the current list preview to render at the size of an iPhone SE.
            .previewDevice(PreviewDevice(rawValue: deviceName))
            // Use the modifier to add the device names as labels for the previews.
            .previewDisplayName(deviceName)
        }
        .environmentObject(UserData())
    }
}
