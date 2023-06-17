//
//  OnboardingView.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 17/06/23.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            
            HeaderView()
                .padding(.bottom, 80)
            
            OnboardingFeatureView()
            
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
