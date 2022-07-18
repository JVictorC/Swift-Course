//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Joao Victo on 24/06/22.
//

import SwiftUI

// Toda ViewModel e uma class e nao struct
class EmojiMemoryGame {
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🕷", "💀"]
        
        return MemoryGame<String>(
            numberOfPairsOfCards: emojis.count
        ) {
            pairIndex in return emojis[pairIndex]
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    
    func chooseCard(card: MemoryGame<String>.Card) {
        model.choose(card: card)
        
    }
}
