//
//  EmojiMemoryGame.swift
//  Memorize2
//
//  Created by Shreemit on 14/09/21.
//

import Foundation

class EmojiMemoryGame: ObservableObject { // ViewModel
    static let emojis = ["đ", "đ", "đ", "âšī¸", "đą", "đ", "đ´", "đĨļ", "đ", "đ", "đĩ", "đ", "đˇ"]
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairs: 8) { pairIndex in
            emojis[pairIndex]
        }
    }
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
