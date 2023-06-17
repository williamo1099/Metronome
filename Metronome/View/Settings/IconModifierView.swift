//
//  IconModifierView.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 17/06/23.
//

import SwiftUI

struct IconModifierView: View {
    // MARK: - PROPERTY
    private let appIcons: [String] = ["Default", "Dark"]
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 15) {
            ForEach(appIcons, id: \.self) { item in
                Button {
                    UIApplication.shared.setAlternateIconName(item == "Default" ? nil : item)
                } label: {
                    Image(item)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(12)
                }
            } //: FOR EACH
            
            Spacer()
        } //: HSTACK
    }
}

// MARK: - PREVIEW
struct IconModifierView_Previews: PreviewProvider {
    static var previews: some View {
        IconModifierView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
