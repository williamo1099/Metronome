//
//  ToolbarView.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 16/06/23.
//

import SwiftUI

// MARK: - EXTENSION
extension Image {
    func toolbarButtonModifier() -> some View {
        self
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundColor(Color.primary)
            .padding(.horizontal, 5)
    }
}

struct ToolbarView: View {
    // MARK: - PROPERTY
    @Binding var metronome: Metronome
    
    @State private var showInfoSheet: Bool = false
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 2) {
            Button {
                // Show info sheet.
                showInfoSheet.toggle()
            } label: {
                Image(systemName: "info.circle")
                    .toolbarButtonModifier()
            }
            .disabled(metronome.isPlaying)
            .sheet(isPresented: $showInfoSheet) {
                InfoView()
            }
            
            Button {
                // Reset metronome.
                metronome = Metronome(bpm: 100, pendulumPosition: 0, isPlaying: false)
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle")
                    .toolbarButtonModifier()
            }
            .disabled(metronome.isPlaying)
        } //: HSTACK
        .padding(.vertical, 10)
        .padding(.leading, 70)
        .padding(.trailing, 30)
        .background(
            Capsule()
                .foregroundColor(Color.accentColor)
        )
    }
}

// MARK: - PREVIEW
struct ToolbarView_Previews: PreviewProvider {
    @State static var metronome: Metronome = Metronome(bpm: 100, pendulumPosition: 0, isPlaying: false)
    
    static var previews: some View {
        ToolbarView(metronome: $metronome)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
