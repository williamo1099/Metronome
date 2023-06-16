//
//  FeatureItemView.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 16/06/23.
//

import SwiftUI

struct FeatureItemView: View {
    // MARK: - PROPERTY
    var image: String
    var description: String
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 25) {
            Image(systemName: image)
                .font(.largeTitle)
                .foregroundColor(Color.accentColor)
            
            Text(description)
                .font(.body)
                .lineLimit(2)
        } //: HSTACK
    }
}

// MARK: - PREVIEW
struct FeatureItemView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureItemView(image: "iphone", description: "The simplest way to start your metronome with the tempo you want.")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
