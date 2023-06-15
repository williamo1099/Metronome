//
//  bpmView.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 15/06/23.
//

import SwiftUI

// MARK: - EXTENSION
extension Image {
    func bpmButtonModifier() -> some View {
        self
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color.accentColor)
    }
}

struct bpmView: View {
    // MARK: - PROPERTY
    @Binding var metronome: Metronome
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Button {
                // Decrease metronome bpm.
                metronome.bpm -= 1
            } label: {
                Image(systemName: "minus.circle.fill")
                    .bpmButtonModifier()
            }
            
            Text("\(metronome.bpm) bpm")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Button {
                // Increase metronome bpm.
                metronome.bpm += 1
            } label: {
                Image(systemName: "plus.circle.fill")
                    .bpmButtonModifier()
            }
        } //: HSTACK
    }
}

// MARK: - PREVIEW
struct bpmView_Previews: PreviewProvider {
    @State static var metronome: Metronome = Metronome(bpm: 100, pendulumPosition: 0, isPlaying: false)
    
    static var previews: some View {
        bpmView(metronome: $metronome)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
