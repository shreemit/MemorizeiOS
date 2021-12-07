//
//  Memorize2App.swift
//  Memorize2
//
//  Created by Shreemit on 13/09/21.
//

import SwiftUI

@main
struct Memorize2App: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
