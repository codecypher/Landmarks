/*
  ProfileHost.swift
  App Design and Layout
  A view that hosts the profile viewer and editor.
*/

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    @State var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if self.mode?.wrappedValue == .active {
                    // Add a cancel button.
                    // Unlike the Done button that EditButton provides, the Cancel button
                    // does not apply the edits to the real profile data in its closure.
                    Button("Cancel") {
                        self.draftProfile = self.userData.profile
                        self.mode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                
                // Create an Edit button that toggles the environment’s edit mode on and off.
                EditButton()
            }
            
            // Add a conditional view that displays either the static profile or the profile editor.
            if self.mode?.wrappedValue == .inactive {
                // Update the view to display the new summary view.
                ProfileSummary(profile: userData.profile)
            } else {
                // The edit profile view displays when you tap Edit.
                ProfileEditor(profile: $draftProfile)
                    // Apply the onAppear and onDisappear modifiers to populate the editor
                    // with the correct profile data and update the persistent profile
                    // when the user taps the Done button.
                    // Otherwise, the old values appear the next time edit mode activates.
                    .onAppear {
                        self.draftProfile = self.userData.profile
                    }
                    .onDisappear {
                        self.userData.profile = self.draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        // Read the user’s profile data from the environment to pass control of the data to the profile host.
        // To avoid updating the global app state before confirming any edits (e.g. while the user enters their name)
        // the editing view operates on a copy of itself.
        ProfileHost().environmentObject(UserData())
    }
}
