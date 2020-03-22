/*
  HikeBadge.swift

  A view that shows a badge for hiking.
 
  This view composes the Badge from Drawing Paths and Shapes along with some descriptive text about the hike.
 
  The badge is just a graphic, so the text in HikeBadge along with the accessibility(label:) modifier
  makes the meaning of the badge clearer to other users.
  
  The two different uses of the frame(width:height:) modifier configure the badge to render at a scaled form
  of its design-time dimensions of 300 × 300 points.
*/

import SwiftUI

struct HikeBadge: View {
    var name: String
    var body: some View {
        VStack(alignment: .center) {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibility(label: Text("Badge for \(name)."))
        }
    }
}

struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Preview Testing")
    }
}
