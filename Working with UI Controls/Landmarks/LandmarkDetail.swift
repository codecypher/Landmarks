/*
  LandmarkDetail.swift
  SwiftUI Essentials: Handling User Input
  A view showing the details for a landmark.
*/

import SwiftUI

struct LandmarkDetail: View {
    // Update the LandmarkDetail view to work with the UserData object in the environment.
    @EnvironmentObject var userData: UserData

    // Add a Landmark property.
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
                    
                    // Create a Favorite Button for Each Landmark.
                    // Create a new button next to the landmark’s name.
                    // In the button’s action closure, the code uses landmarkIndex
                    // with the userData object to update the landmark in place.
                    Button(action: {
                        self.userData.landmarks[self.landmarkIndex]
                            .isFavorite.toggle()
                    }) {
                        // Use an if-else conditional statement to provide different images that indicate
                        // whether the landmark is a favorite.
                        if self.userData.landmarks[self.landmarkIndex]
                            .isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
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
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        // Update the preview to use the first landmark from landmarkData.
        return LandmarkDetail(landmark: userData.landmarks[0])
            .environmentObject(userData)
    }
}
