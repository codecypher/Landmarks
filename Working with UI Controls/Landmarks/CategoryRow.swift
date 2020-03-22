/*
  CategoryRow.swift
  App Design and Layout: Composing Complex Interfaces
  A view showing a scrollable list of landmarks.
*/

import SwiftUI

struct CategoryRow: View {
    // This view needs to store information about the specific category of landmark
    // that it is displaying along with the landmarks themselves.
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            // Give the rows room to breathe by specifying a tall frame(width:height:)
            // and wrapping the stack in a scroll view.
            ScrollView(.horizontal, showsIndicators: false) {
                // Display this category’s landmarks in an HStack.
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { landmark in
                        // Wrap the existing CategoryItem with a NavigationLink.
                        // The category item itself is the label for the button and its destination
                        // is the landmark detail view for the landmark represented by the card.
                        NavigationLink(
                            destination: LandmarkDetail(
                                landmark: landmark
                            )
                        ) {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

// Create a new custom view called CategoryItem alongside CategoryRow
// and replace the Text that holds the landmark name text with the new view.
struct CategoryItem: View {
    var landmark: Landmark
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: landmarkData[0].category.rawValue,
            items: Array(landmarkData.prefix(4))
        )
        .environmentObject(UserData())
    }
}
