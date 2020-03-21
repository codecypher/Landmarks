/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A model object that stores app data.
*/

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    // Update the class to include an instance of the user profile
    // that persists even after the user dismisses the profile view.
    @Published var profile = Profile.default
}
