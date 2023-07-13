//
//  ContentView.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 15/06/23.
//

import SwiftUI

struct MainView: View {
    // MARK: - PROPERTY
    @ObservedObject var viewModel: MetronomeViewModel = MetronomeViewModel()
    
    @State var openToolbar: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            VStack {
                bpmView(viewModel: viewModel)
                
                Spacer()
                
                MetronomeView(viewModel: viewModel)
                
                Spacer()
                
                ButtonView(viewModel: viewModel)
            } //: VSTACK
            .padding()
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    ToolbarView(viewModel: viewModel, openToolbar: $openToolbar)
                        .offset(x: openToolbar ? -50 : -150)
                        .opacity(openToolbar ? 1.0 : 0.7)
                    
                        .onTapGesture {
                            withAnimation(.easeOut(duration: 0.35)) {
                                openToolbar.toggle()
                            }
                        }
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
