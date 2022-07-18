//
//  ContentView.swift
//  Memorize
//
//  Created by Joao Victo on 23/06/22.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards){ card in
                CardView(card: card).onTapGesture {
                    viewModel.chooseCard(card: card)
                }
            }
        }
        .frame(
            width: UIScreen.main.bounds.size.width,
            height: UIScreen.main.bounds.size.height,
            alignment: .top
        )
        .padding()
        .padding(.top, 70)
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .frame(height: 60)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3)
                    .foregroundColor(Color.orange)
                    .frame(height: 60)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.orange)
                    .frame(height: 60)
            }
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            viewModel: EmojiMemoryGame()
        )
    }
}
