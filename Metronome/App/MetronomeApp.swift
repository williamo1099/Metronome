//
//  MetronomeApp.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 15/06/23.
//

import SwiftUI

@main
struct MetronomeApp: App {
    // MARK: - PROPERTY
    @AppStorage("onboardingView") var onboardingViewActive: Bool = true
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            if onboardingViewActive {
                OnboardingView()
            } else {
                MainView()
            }
        }
    }
}
