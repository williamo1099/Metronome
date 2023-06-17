//
//  OnboardingView.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 17/06/23.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTY
    private var featureItems: [[String]] = [
        ["iphone", "A simple one view app to start your metronome anytime you want."],
        ["slider.vertical.3", "Set the metronome to the tempo you want between 40 and 200."],
        ["arrow.triangle.2.circlepath", "Reset the metronome to its default settings anytime you want."]
    ]
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            
            OnboardingHeaderView()
                .padding(.bottom, 80)
            
            VStack(spacing: 30) {
                ForEach(featureItems, id: \.self) { item in
                    OnboardingFeatureItemView(image: item[0], description: item[1])
                }
            } //: VSTACK
            
            Spacer()
            
            OnboardingButtonView()
                .padding(.bottom, 30)
        } //: VSTACK
    }
}

// MARK: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .preferredColorScheme(.dark)
    }
}
