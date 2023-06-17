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
    
    @State private var sliding: Bool = false
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
                .overlay(
                    Image("arrow")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .offset(y: 60)
                        .foregroundColor(Color.accentColor)
                        .opacity(sliding ? 0.8 : 0.0)
                )
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            withAnimation(.easeOut(duration: 0.5)) {
                                sliding = true
                            }
                            
                            let addition = Int(gesture.translation.width / 100)
                            if metronome.bpm + addition <= 200 &&
                                metronome.bpm + addition >= 40 {
                                metronome.bpm += addition
                            }
                        } //: ON CHANGED
                    
                        .onEnded { _ in
                            withAnimation(.easeOut(duration: 0.5)) {
                                sliding = false
                            }
                        } //: ON ENDED
                )
            
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
