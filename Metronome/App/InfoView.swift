//
//  InfoView.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 16/06/23.
//

import SwiftUI

struct InfoView: View {
    // MARK: - PROPERTY
    private var featureItems: [[String]] = [
        ["iphone", "The simplest one view app to start your metronome anytime you want."],
        ["slider.vertical.3", "Set the metronome to whatever tempo you want between 40 and 200."],
        ["arrow.triangle.2.circlepath", "Reset the metronome to its default settings anytime you want."]
    ]
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            
            HeaderView()
                .padding(.bottom, 80)
            
            VStack(spacing: 30) {
                ForEach(featureItems, id: \.self) { item in
                    FeatureItemView(image: item[0], description: item[1])
                }
            } //: VSTACK
            
            Spacer()
        } //: VSTACK
    }
}

// MARK: - PREVIEW
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .preferredColorScheme(.dark)
    }
}
