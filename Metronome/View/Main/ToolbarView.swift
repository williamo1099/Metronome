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
    @ObservedObject var viewModel: MetronomeViewModel
    @Binding var openToolbar: Bool
    
    @State private var showSettingsSheet: Bool = false
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 2) {
            Button {
                // Reset metronome.
                viewModel.resetMetronome()
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath")
                    .toolbarButtonModifier()
            }
            .disabled(viewModel.getIsPlaying())
            
            Button {
                // Show info sheet.
                showSettingsSheet.toggle()
            } label: {
                Image(systemName: "gear")
                    .toolbarButtonModifier()
            }
            .disabled(viewModel.getIsPlaying())
            .sheet(isPresented: $showSettingsSheet) {
                SettingsView()
            }
            
            Spacer()
        } //: HSTACK
        .opacity(openToolbar ? 1.0 : 0.0)
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
    static var viewModel: MetronomeViewModel = MetronomeViewModel()
    
    static var previews: some View {
        ToolbarView(viewModel: viewModel, openToolbar: .constant(true))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
