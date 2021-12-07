//
//  MemoryGame.swift
//  Memorize2
//
//  Created by Shreemit on 14/09/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable { // Model
    private(set) var cards: [Card]
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    init(numberOfPairs: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0 ..< numberOfPairs {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        // Add numberOfPairs of Cards * 2 into cards arrays
    }

    mutating func choose(_ card: Card) {
//        if let choosenIndex = index(of: card) {
//            cards[choosenIndex].isFaceUp.toggle()
//        }
        if let choosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[choosenIndex].isFaceUp,
           !cards[choosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
				if cards[choosenIndex].content == cards[potentialMatchIndex].content {
                    cards[choosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = choosenIndex
            }
            cards[choosenIndex].isFaceUp.toggle()
        }
    }

    func index(of choosedCard: Card) -> Int? {
        for index in 0 ..< cards.count {
            if cards[index].id == choosedCard.id {
                return index
            }
        }
        return nil
    }

    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
