//
//  AudioPlayer.swift
//  Metronome
//
//  Created by William Oktavianus Kurniawan on 15/06/23.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playAudio(name: String, type: String) {
    if let path = Bundle.main.path(forResource: name, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not play audio.")
        }
    }
}
