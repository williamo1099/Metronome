//
//  MetronomeView.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 15/06/23.
//

import SwiftUI

struct MetronomeView: View {
    // MARK: - PROPERTY
    @Binding var metronome: Metronome
    
    // MARK: - BODY
    var body: some View {
        Image("metronome-1")
            .resizable()
            .scaledToFit()
            .foregroundColor(Color.primary)
    }
}

// MARK: - PREVIEW
struct MetronomeView_Previews: PreviewProvider {
    @State static var metronome: Metronome = Metronome(bpm: 100, pendulumPosition: 0, isPlaying: false)
    
    static var previews: some View {
        MetronomeView(metronome: $metronome)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
