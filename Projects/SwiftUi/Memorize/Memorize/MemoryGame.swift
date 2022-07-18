//
//  MemoryGame.swift
//  Memorize
//
//  Created by Joao Victo on 24/06/22.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex);
            
            cards.append(
                Card(id: pairIndex*2, content: content)
            )
            
            cards.append(
                Card(id: pairIndex*2+1, content: content)
            )
        }
    }
    
    func choose(card: Card) -> Void {
        print("card choose: \(card)")
        
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        
    }
    
}
