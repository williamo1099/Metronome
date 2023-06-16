//
//  HeaderView.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 16/06/23.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - BODY
    var body: some View {
        VStack {
            Image("metronome-0")
                .resizable()
                .foregroundColor(Color.accentColor)
                .frame(width: 70, height: 70)
            
            Text("Metronome")
                .font(.title)
                .fontWeight(.bold)
        } //: VSTACK
    }
}

// MARK: - PREVIEW
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
