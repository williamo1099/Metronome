//
//  InfoView.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 16/06/23.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - BODY
    var body: some View {
        VStack {
            HeaderView()
                .padding()
                .padding(.bottom, 20)
                .overlay(
                    Rectangle()
                        .fill(Color.primary)
                        .frame(width: 100, height: 4)
                        .cornerRadius(12)
                    , alignment: .top
                )
            
            Form {
                // ICON MODIFIER
                Section("Change the app icon") {
                    IconModifierView()
                } //: SECTION
            } //: FORM
            
            Spacer()
        } //: VSTACK
        .padding()
    }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
