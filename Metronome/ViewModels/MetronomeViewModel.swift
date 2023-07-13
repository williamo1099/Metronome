//
//  MetronomeViewModel.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 13/07/23.
//

import Foundation

class MetronomeViewModel: ObservableObject {
    @Published var metronome: Metronome
    
    private var timer: Timer?
    
    /**
     The constructor for MetronomeViewModel class.
     Metronome is initialized with the default metronome value.
     
     # Notes: #
     1. The default bpm value is 100, default pendulum position value is left and default playing value is false.
     
     */
    init() {
        self.metronome = Metronome(bpm: 100, pendulumPosition: .left, isPlaying: false)
    }
    
    func getBpm() -> Int {
        return self.metronome.bpm
    }
    
    func getPendulumPosition() -> String {
        return self.metronome.pendulumPosition.rawValue
    }
    
    func getIsPlaying() -> Bool {
        return self.metronome.isPlaying
    }
    
    /**
     Reset the current metronome to its default value.
     
     - parameter metronome: Optional. The new metronome value to be set.
     
     # Notes: #
     1. The default bpm value is 100, default pendulum position value is left and default playing value is false.
     
    */
    func resetMetronome(_ metronome: Metronome = Metronome(bpm: 100, pendulumPosition: .left, isPlaying: false)) {
        self.metronome = metronome
    }
    
    /**
    Increase the current metronome's bpm.

    - parameter by: The amount of bpm.

     # Notes: #
     1. The maximum of metronome's bpm value is 200.
     
    */
    func increaseBpm(by bpm: Int = 1) {
        if self.metronome.bpm + bpm <= 200 {
            self.metronome.bpm += bpm
        }
    }
    
    /**
     Decrease the current metronome's bpm.
     
     - parameter by: The amount of bpm.
     
     # Notes: #
     1. The minimum of metronome's bpm value is 40.
     
    */
    func decreaseBpm(by bpm: Int = 1) {
        if self.metronome.bpm - bpm >= 40 {
            self.metronome.bpm -= bpm
        }
    }
    
    /**
     Start the metronome when not playing or stop the metronome when playing.
     
    */
    func startMetronome() {
        if !self.metronome.isPlaying {
            // Start the metronome.
            timer = Timer.scheduledTimer(withTimeInterval: 60.0 / Double(self.metronome.bpm), repeats: true) { _ in
                // Switch the metronome's pendulum position.
                switch self.metronome.pendulumPosition {
                case .left:
                    self.metronome.pendulumPosition = .right
                case .right:
                    self.metronome.pendulumPosition = .left
                }
                
                playAudio(name: "metronome-click", type: "m4a")
            }
        } else {
            // Stop the metronome.
            if timer != nil {
                timer?.invalidate()
            }
            timer = nil
            timer = Timer()
        }
        
        self.metronome.isPlaying.toggle()
    }
}
