//
//  OnboardingFeatureView.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 17/06/23.
//

import SwiftUI

struct OnboardingFeatureView: View {
    // MARK: - PROPERTY
    private let featureItems: [[String]] = [
        ["iphone", "A simple one view app to start your metronome anytime you want."],
        ["slider.horizontal.below.rectangle", "Slide to increase or decrease the metronome tempo with ease."],
        ["slider.vertical.3", "Customize the app by changing the app icon and more."],
        ["arrow.triangle.2.circlepath", "Reset the metronome to its default settings anytime you want."]
    ]
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 30) {
            ForEach(featureItems, id: \.self) { item in
                OnboardingFeatureItemView(image: item[0], label: item[1])
            } //: FOR EACH
        } //: VSTACK
    }
}

// MARK: - PREVIEW
struct OnboardingFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingFeatureView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
