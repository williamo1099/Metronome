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
    @ObservedObject var viewModel: MetronomeViewModel
    
    @State private var sliding: Bool = false
    @State private var animating: Bool = false
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Button {
                // Decrease metronome bpm.
                viewModel.decreaseBpm()
            } label: {
                Image(systemName: "minus.circle.fill")
                    .bpmButtonModifier()
                    .offset(x: animating ? 0.0 : -20.0)
            }
            .disabled(viewModel.getIsPlaying())
            
            Text("\(viewModel.getBpm()) bpm")
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
                            
                            let translationValue = Int(gesture.translation.width / 100)
                            if translationValue > 0 {
                                // Sliding to the right (positive value).
                                viewModel.increaseBpm(by: translationValue)
                            } else {
                                // Sliding to the left (negative value).
                                viewModel.decreaseBpm(by: -translationValue)
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
                viewModel.increaseBpm()
            } label: {
                Image(systemName: "plus.circle.fill")
                    .bpmButtonModifier()
                    .offset(x: animating ? 0.0 : 20.0)
            }
            .disabled(viewModel.getIsPlaying())
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
    static var viewModel: MetronomeViewModel = MetronomeViewModel()
    
    static var previews: some View {
        bpmView(viewModel: viewModel)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
