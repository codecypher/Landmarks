/*
  UserData.swift
  A model object that stores app data.
*/

import Combine
import SwiftUI

// We store the landmark data in an observable object.
// An observable object is a custom object for your data that can be bound to a view
// from storage in SwiftUI’s environment. SwiftUI watches for any changes to
// observable objects that could affect a view, and displays the correct version
// of the view after a change.
final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    
    // Update the class to include an instance of the user profile
    // that persists even after the user dismisses the profile view.
    @Published var profile = Profile.default
}
