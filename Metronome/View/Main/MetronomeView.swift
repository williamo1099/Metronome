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
    
    @State private var animating: Bool = false
    
    // MARK: - BODY
    var body: some View {
        Image("metronome-\(metronome.pendulumPosition)")
            .resizable()
            .scaledToFit()
            .foregroundColor(Color.primary)
            .opacity(animating ? 1.0 : 0.0)
            .offset(y: animating ? 20.0 : 0.0)
            .onAppear {
                withAnimation(.easeOut(duration: 0.5)) {
                    animating = true
                }
            }
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
