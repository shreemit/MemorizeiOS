//
//  ContentView.swift
//  Memorize2
//
//  Created by Shreemit on 13/09/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        VStack{
            HStack {
                Text("Memorize").font(.largeTitle).padding(/*@START_MENU_TOKEN@*/.leading, 8.0/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card).aspectRatio(2 / 3, contentMode: .fit).onTapGesture {
                            viewModel.choose(card)
                        }
                    }
                }.foregroundColor(.red)
            }
        }
    }
} 

struct CardView: View {
    let card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill().foregroundColor(.red)
            }
        }
        .padding()
        .foregroundColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        Group {
            ContentView(viewModel: game)
                .preferredColorScheme(.dark)
        }
    }
}
