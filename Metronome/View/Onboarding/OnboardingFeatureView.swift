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
        ["slider.vertical.3", "Set the metronome to the tempo you want between 40 and 200."],
        ["arrow.triangle.2.circlepath", "Reset the metronome to its default settings anytime you want."]
    ]
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 30) {
            ForEach(featureItems, id: \.self) { item in
                HStack(spacing: 15) {
                    Image(systemName: item[0])
                        .font(.largeTitle)
                        .foregroundColor(Color.accentColor)
                        .frame(width: 80)
                    
                    Text(item[1])
                        .font(.body)
                        .frame(width: 300, alignment: .leading)
                } //: HSTACK
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
