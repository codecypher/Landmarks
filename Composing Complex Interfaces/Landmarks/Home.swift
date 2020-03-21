/*
  CategoryHome
  A view showing featured landmarks above a list of all of the landmarks.
*/

import SwiftUI

struct CategoryHome: View {
    // Group landmarks into categories using the Dictionary structure’s init(grouping:by:) initializer,
    // keying off of the landmarks’ category property.
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarkData,
            by: { $0.category.rawValue }
        )
    }
    
    var featured: [Landmark] {
        landmarkData.filter { $0.isFeatured }
    }
    
    // SwiftUI shows the placeholder user profile when the showProfile state variable is set to true
    // and sets showProfile back to false when the user dismisses the modal.
    @State var showingProfile = false
    
    // Add a button to the navigation bar that toggles showProfile from false to true when tapped.
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }

    var body: some View {
        // Add a NavigationView to host the different views in Landmarks.
        // You use navigation views along with NavigationLink instances and related modifiers
        // to build hierarchical navigation structures in your app.
        NavigationView {
            // Display the categories in Landmarks using a List.
            List {
                FeaturedLandmarks(landmarks: featured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    // Set the edge insets to zero on both kinds of landmark previews
                    // so the content can extend to the edges of the display.
                    .listRowInsets(EdgeInsets())
                
                // The Landmark.Category case name identifies each item in the list
                // which must be unique among other categories because it is an enumeration.
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    // Update the body of CategoryHome to pass category information to the new row type.
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                // Set the edge insets to zero on both kinds of landmark previews
                // so the content can extend to the edges of the display.
                .listRowInsets(EdgeInsets())
                
                // Add a navigation link that leads to a filterable list of all landmarks.
                NavigationLink(destination: LandmarkList()) {
                    Text("See All")
                }
            }
            // Set the title of the navigation bar to Featured.
            .navigationBarTitle(Text("Featured"))
            
            // Add a button to the navigation bar.
            .navigationBarItems(trailing: profileButton)
            
            // Add a presentation that displays the user profile in a modal view
            // after tapping the profile icon in the tab bar.
            .sheet(isPresented: $showingProfile) {
                Text("User Profile")
            }
        }
    }
}

// Add a simple view called FeaturedLandmarks that displays only the landmarks marked isFeatured.
// You will turn this view into an interactive carousel in a later tutorial.
// For now, it displays one of the featured landmarks with a scaled and cropped preview image.
struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    var body: some View {
        landmarks[0].image.resizable()
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(UserData())
    }
}
