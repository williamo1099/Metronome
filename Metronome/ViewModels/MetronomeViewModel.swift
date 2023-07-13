//
//  MetronomeViewModel.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 13/07/23.
//

import Foundation

class MetronomeViewModel: ObservableObject {
    @Published var metronome: Metronome
    
    init(with metronome: Metronome) {
        self.metronome = metronome
    }
    
    /**
    Increase the current metronome's bpm.

    - parameter by: The amount of bpm.

     # Notes: #
     1. The maximum of metronome's bpm is 200.
    */
    mutating func increaseBpm(by bpm: Int = 1) {
        if metronome.bpm + bpm <= 200 {
            metronome.bpm += bpm
        }
    }
    
    /**
     Decrease the current metronome's bpm.
     
     - parameter by: The amount of bpm.
     
     # Notes: #
     1. The minimum of metronome's bpm is 40.
     */
    mutating func decreaseBpm(by bpm: Int = 1) {
        if metronome.bpm - bpm >= 40 {
            metronome.bpm -= bpm
        }
    }
}
