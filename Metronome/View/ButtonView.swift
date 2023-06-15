//
//  ButtonView.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 15/06/23.
//

import SwiftUI

struct ButtonView: View {
    // MARK: - PROPERTY
    @Binding var metronome: Metronome
    
    // MARK: - BODY
    var body: some View {
        Button {
            // Start metronome.
            metronome.isPlaying.toggle()
        } label: {
            Text(metronome.isPlaying ? "STOP" : "START")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color.primary)
                .padding(.vertical, 10)
                .padding(.horizontal, 30)
            
                .background(
                    Capsule()
                        .fill(Color.accentColor)
                        .frame(minWidth: 0, maxWidth: .infinity)
                )
        }

    }
}

// MARK: - PREVIEW
struct ButtonView_Previews: PreviewProvider {
    @State static var metronome: Metronome = Metronome(bpm: 100, pendulumPosition: 0, isPlaying: false)
    
    static var previews: some View {
        ButtonView(metronome: $metronome)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
