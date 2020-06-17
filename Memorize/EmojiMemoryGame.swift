//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Pedro Felipe Coloma de Araujo on 28/05/20.
//  Copyright © 2020 Pedro Felipe Coloma de Araujo. All rights reserved.
//

import Foundation

class EmojiMemoryGame {
    private(set) var model: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let availableEmojis = ["👻", "🎃", "🤦‍♂️", "🧙‍♂️", "🧛‍♂️", "🍀"]
        let numberOfPairs = Int.random(in: 2...5)
        var selectedEmojis = Set<String>()
        while selectedEmojis.count < numberOfPairs {
            selectedEmojis.insert(availableEmojis.randomElement() ?? "")
        }
        let emojis = [String](selectedEmojis)
        
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards.shuffled()
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}
