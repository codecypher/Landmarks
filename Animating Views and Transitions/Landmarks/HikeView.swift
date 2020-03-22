/*
  Abstract: A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false
    
    // Extract the transition to be a static property of AnyTransition.
    // This keeps your code clean as you expand the custom transition.
    // You can use the same dot notation for your custom transitions as you do with SwiftUI’s included ones.
    var transition: AnyTransition {
        // Use the move(edge:) transition, so that the graph slides in and out from the same side.
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        
        // Use the asymmetric(insertion:removal:) modifier to provide different transitions
        // for when the view appears and disappears.
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                    .animation(nil)
                
                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }
                
                Spacer()

                Button(action: {
                    withAnimation {
                    	self.showDetail.toggle()
                    }
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        //.animation(nil)
                        // Add another animatable change by making the button larger when the graph is visible.
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                        // Turn on animation for the button’s rotation
                        //.animation(.spring())
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
                    // Add a transition(_:) modifier to the conditionally visible HikeView.
                    // Now the graph appears and disappears by slciding in and out of sight.
                	.transition(transition)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: hikeData[0])
                .padding()
            Spacer()
        }
    }
}
