//
//  MemoryGame.swift
//  Memorize2
//
//  Created by Shreemit on 14/09/21.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card]

    init(numberOfPairs: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0 ..< numberOfPairs {
            let content: CardContent = createCardContent(pairIndex)
                cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
        // Add numberOfPairs of Cards * 2 into cards arrays
    }

    func choose(_ card: Card) {
    }

    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
