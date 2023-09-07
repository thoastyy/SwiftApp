//
//  bio1view.swift
//  carousel
//
//  Created by user on 7/9/23.
//

import SwiftUI

struct BioView: View {
    @State private var showSettings = false
    let buskerObj: Busker
    
    var body: some View {
        Button("View Bio") {
            showSettings = true
        }
        .buttonStyle(.borderedProminent)
        
        .sheet(isPresented: $showSettings) {
            SettingsView(buskerObj: buskerObj)
                .presentationDetents([.medium, .large])
            
        }
    }
    
}

struct SettingsView: View {
    let buskerObj: Busker
    
    var body: some View {
        Text(buskerObj.bio)
            .fontWeight(.semibold)
            .multilineTextAlignment(.leading)
            .padding([.top, .leading, .trailing])
    }
    
    //
    //        Text("age 👦🏻: 17\n\nbio ♨️:\nBusking since 2010 🤸🏻\nCurrently studying in SP, DIT 📲\nI wield the acoustic guitar like an old friend, coaxing soulful harmonies and enchanting rhythms that will transport you to another world.\nBusking isn't just about the coins in my hat🎩, it's about the connection with you, the incredible people passing by. My music🎶 is my gift to the world, and your smiles and applause are my greatest rewards.\nWhether you're seeking solace in a melody or a dance partner👯‍♀️ for your daily rhythm, come join me on the sidewalk, and together, we'll paint the town with music. See you out there!💁🏻‍♂️\n\nlocation📍:\n1.304331, 103.833915\nLucky Plaza\nhttps://maps.apple.com/?address=304%20Orchard%20Rd,%20Singapore%20238863&auid=16791975700011038373&ll=1.304331,103.833915&lsp=9902&q=Lucky%20Plaza")
    //            .fontWeight(.semibold)
    //            .multilineTextAlignment(.leading)
    //            .padding([.top, .leading, .trailing])
    //
    //    }
    
}
