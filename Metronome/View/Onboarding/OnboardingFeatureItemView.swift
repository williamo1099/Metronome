//
//  OnboardingFeatureItemView.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 18/06/23.
//

import SwiftUI

struct OnboardingFeatureItemView: View {
    // MARK: - PROPERTY
    let image: String
    let label: String
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: image)
                .font(.largeTitle)
                .foregroundColor(Color.accentColor)
                .frame(width: 80)
            
            Text(label)
                .font(.body)
                .frame(width: 300, alignment: .leading)
        } //: HSTACK
    }
}

// MARK: - PREVIEW
struct OnboardingFeatureItemView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingFeatureItemView(image: "iphone", label: "A simple one view app to start your metronome anytime you want.")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
