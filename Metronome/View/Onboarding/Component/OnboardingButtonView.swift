//
//  OnboardingButtonView.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 17/06/23.
//

import SwiftUI

struct OnboardingButtonView: View {
    // MARK: - PROPERTY
    @AppStorage("onboardingView") var onboardingViewActive: Bool = true
    
    // MARK: - BODY
    var body: some View {
        Button {
            onboardingViewActive = false
        } label: {
            Text("Let's go!")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 50)
                .background(
                    Capsule()
                        .fill(Color.accentColor)
                )
        } //: BUTTON
    }
}

// MARK: - PREVIEW
struct OnboardingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingButtonView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
