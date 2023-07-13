//
//  MetronomeView.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 15/06/23.
//

import SwiftUI

struct MetronomeView: View {
    // MARK: - PROPERTY
    @ObservedObject var viewModel: MetronomeViewModel
    
    @State private var animating: Bool = false
    
    // MARK: - BODY
    var body: some View {
        Image("metronome-\(viewModel.getPendulumPosition())")
            .resizable()
            .scaledToFit()
            .foregroundColor(Color.primary)
            .opacity(animating ? 1.0 : 0.0)
            .onAppear {
                withAnimation(.easeOut(duration: 0.5)) {
                    animating = true
                }
            }
    }
}

// MARK: - PREVIEW
struct MetronomeView_Previews: PreviewProvider {
    static var viewModel: MetronomeViewModel = MetronomeViewModel()
    
    static var previews: some View {
        MetronomeView(viewModel: viewModel)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
