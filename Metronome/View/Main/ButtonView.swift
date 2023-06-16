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
    
    @State private var timer: Timer?
    @State private var animating: Bool = false
    
    // MARK: - BODY
    var body: some View {
        Button {
            // Start metronome.
            if !metronome.isPlaying {
                // Start metronome
                timer = Timer.scheduledTimer(withTimeInterval: 60.0 / Double(metronome.bpm), repeats: true) {_ in
                    if metronome.pendulumPosition + 1 <= 2 {
                        metronome.pendulumPosition += 1
                    } else {
                        metronome.pendulumPosition = 1
                    }
                    
                    playAudio(name: "metronome-click", type: "m4a")
                }
            } else {
                // Stop metronome
                if timer != nil {
                    timer?.invalidate()
                }
                timer = nil
                timer = Timer()
                metronome.pendulumPosition = 0
            }

            metronome.isPlaying.toggle()
        } label: {
            Text(metronome.isPlaying ? "STOP" : "START")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color.primary)
                .padding(.vertical, 10)
                .padding(.horizontal, 30)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(
                    Capsule()
                        .fill(Color.accentColor)
                )
                .opacity(animating ? 1.0 : 0.0)
        } //: BUTTON
        
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                animating = true
            }
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
