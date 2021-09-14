//
//  EmojiMemoryGame.swift
//  Memorize2
//
//  Created by Shreemit on 14/09/21.
//

import Foundation

func makeCardContent(index: Int) -> String {
    return "😀"
}

class EmojiMemoryGame {
    static let emojis = ["😂", "😅", "😇", "☹️", "😱", "😃", "😴", "🥶", "🙄", "😈", "😵", "😜", "😷"]
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairs: 4) { pairIndex in
            emojis[pairIndex]
        }
    }

    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
}
