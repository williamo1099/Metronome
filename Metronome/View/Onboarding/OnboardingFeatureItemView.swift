//
//  FeatureItemView.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 16/06/23.
//

import SwiftUI

struct OnboardingFeatureItemView: View {
    // MARK: - PROPERTY
    var image: String
    var description: String
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: image)
                .font(.largeTitle)
                .foregroundColor(Color.accentColor)
                .frame(width: 80)
            
            Text(description)
                .font(.body)
                .frame(width: 300, alignment: .leading)
        } //: HSTACK
    }
}

// MARK: - PREVIEW
struct FeatureItemView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingFeatureItemView(image: "iphone", description: "This is a placeholder text. This is a placeholder text.")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
