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
    
    @State private var animating: Bool = false
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Button {
                // Decrease metronome bpm.
                if metronome.bpm > 40 {
                    metronome.bpm -= 1
                }
            } label: {
                Image(systemName: "minus.circle.fill")
                    .bpmButtonModifier()
                    .offset(x: animating ? 0.0 : -20.0)
            }
            .disabled(metronome.isPlaying)
            
            Text("\(metronome.bpm) bpm")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .frame(minWidth: 150)
            
            Button {
                // Increase metronome bpm.
                if metronome.bpm < 200 {
                    metronome.bpm += 1
                }
            } label: {
                Image(systemName: "plus.circle.fill")
                    .bpmButtonModifier()
                    .offset(x: animating ? 0.0 : 20.0)
            }
            .disabled(metronome.isPlaying)
        } //: HSTACK
        .opacity(animating ? 1.0 : 0.0)
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                animating = true
            }
        }
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
