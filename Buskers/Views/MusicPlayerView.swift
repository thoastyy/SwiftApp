//
//  musicPlayer.swift
//  carousel
//
//  Created by user on 6/9/23.
//

import SwiftUI
import AVFoundation

struct musicPlayer: View {
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        Button(action: {
                    playAudio()
                }) {
                    Text("Now Playing")
//                        .font(.headline)
//                        .foregroundColor(.black)
                        
                }
                .buttonStyle(.borderedProminent)

    }
    
    func playAudio() {
            if let audioPlayer = audioPlayer {
                if audioPlayer.isPlaying {
                    audioPlayer.stop()
                } else {
                    audioPlayer.play()
                }
            } else {
                // Load the audio file from your app's bundle
                if let audioFileURL = Bundle.main.url(forResource: "enchanted", withExtension: "mp3") {
                    do {
                        // Initialize the audio player
                        audioPlayer = try AVAudioPlayer(contentsOf: audioFileURL)
                        audioPlayer?.play()
                    } catch {
                        print("Error initializing audio player: \(error)")
                    }
                }
            }
        }
}
