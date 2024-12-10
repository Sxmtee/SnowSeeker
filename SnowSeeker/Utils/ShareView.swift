//
//  ShareView.swift
//  SnowSeeker
//
//  Created by mac on 10/12/2024.
//

import SwiftUI

@Observable
class Player {
    var name = "Anonymous"
    var highScore = 0
}

struct HighScoreView: View {
    @Environment(Player.self) var player

    var body: some View {
        @Bindable var player = player
        
        Stepper("High score: \(player.highScore)", value: $player.highScore)
            .padding()
    }
}

struct ShareView: View {
    @State private var player = Player()

    var body: some View {
       VStack {
           Text("Welcome!")
           HighScoreView()
       }
       .environment(player)
    }
}

#Preview {
    ShareView()
}
