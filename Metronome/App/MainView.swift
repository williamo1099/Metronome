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
        NavigationStack {
            VStack {
                bpmView(metronome: $metronome)
                
                Spacer()
                
                MetronomeView(metronome: $metronome)
                
                Spacer()
                
                ButtonView(metronome: $metronome)
            } //: VSTACK
            .padding()
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    ToolbarView(metronome: $metronome)
                        .offset(x: -150)
                } //: TOOLBAR ITEM
            } //: TOOLBAR
        } //: NAVIGATION STACK
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}
