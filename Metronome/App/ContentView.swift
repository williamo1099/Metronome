//
//  ContentView.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 15/06/23.
//

import SwiftUI

struct ContentView: View {
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
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
