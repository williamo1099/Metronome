//
//  ContentView.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 15/06/23.
//

import SwiftUI

struct MainView: View {
    // MARK: - PROPERTY
    @State var metronome: Metronome = Metronome(bpm: 100, pendulumPosition: 0, isPlaying: false)
    
    // MARK: - BODY
    var body: some View {
        VStack {
            bpmView(metronome: $metronome)
            
            Spacer()
            
            MetronomeView(metronome: $metronome)
            
            Spacer()
            
            ButtonView(metronome: $metronome)
        } //: VSTACK
        .padding()
        .overlay(
            Button {
                // Reset metronome.
                metronome = Metronome(bpm: 100, pendulumPosition: 0, isPlaying: false)
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .font(.title)
                    .foregroundColor(Color.accentColor)
                    .padding()
            }
            .disabled(metronome.isPlaying)
            , alignment: .trailing
        )
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}
