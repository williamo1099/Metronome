//
//  ButtonView.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 15/06/23.
//

import SwiftUI

struct StartButtonView: View {
    // MARK: - PROPERTY
    @ObservedObject var viewModel: MetronomeViewModel
    
    @State private var animating: Bool = false
    
    // MARK: - BODY
    var body: some View {
        Button {
            // Start or stop the metronome.
            viewModel.startMetronome()
        } label: {
            Text(viewModel.getIsPlaying() ? "STOP" : "START")
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
struct StartButtonView_Previews: PreviewProvider {
    static var viewModel: MetronomeViewModel = MetronomeViewModel()
    
    static var previews: some View {
        StartButtonView(viewModel: viewModel)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
