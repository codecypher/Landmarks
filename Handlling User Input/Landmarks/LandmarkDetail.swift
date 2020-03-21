/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a landmark.
*/

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    
    // add a Landmark property to the LandmarkDetail type.
    var landmark: Landmark

    // Update the LandmarkDetail view to work with the UserData object in the environment.
    // You will use landmarkIndex when accessing or updating the landmark’s favorite status,
    // so that you are always accessing the correct version of that data.
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        VStack {
            // Pass the required data down to your custom types.
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)

            CircleImage(image: landmark.image)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                }
    

                // Create a new button next to the landmark’s name.
                Button(action: {
                    self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                }) {
                    // Use an if-else conditional statement to provide different images that indicate
                    // whether the landmark is a favorite.
                    if self.userData.landmarks[self.landmarkIndex].isFavorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    } else {
                        Image(systemName: "star")
                            .foregroundColor(Color.gray)
                    }
                }
                
                HStack(alignment: .top) {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            .padding()

            Spacer()
        }
        // Call the modifier to give the navigation bar a title when showing the detail view.
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        // Update the preview to use the first landmark from landmarkData.
        LandmarkDetail(landmark: landmarkData[0])
            .environmentObject(UserData())
    }
}
