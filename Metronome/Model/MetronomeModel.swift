//
//  MetronomeModel.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 15/06/23.
//

import Foundation

enum PendulumPosition: String {
    case left = "left"
    case right = "right"
}

struct Metronome {
    var bpm: Int
    var pendulumPosition: PendulumPosition
    var isPlaying: Bool
}
