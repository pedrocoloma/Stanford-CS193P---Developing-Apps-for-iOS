//
//  ContentView.swift
//  Memorize
//
//  Created by Pedro Felipe Coloma de Araujo on 20/05/20.
//  Copyright © 2020 Pedro Felipe Coloma de Araujo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewMoodel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewMoodel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewMoodel.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewMoodel: EmojiMemoryGame())
    }
}
