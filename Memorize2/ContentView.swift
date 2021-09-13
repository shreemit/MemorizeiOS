//
//  ContentView.swift
//  Memorize2
//
//  Created by Shreemit on 13/09/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["😂", "😅", "😇", "☹️", "😱", "😃", "😴", "🥶","🙄","😈","😵","😜","😷"]
    @State var emojiCount = 4
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            VStack {
                Image(systemName: "minus.circle")
            }
        }
    }

    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            VStack {
                Image(systemName: "plus.circle")
            }
        }
    }

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
                    ForEach(emojis[0 ..< emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2 / 3, contentMode: .fit)
                    }
                }.foregroundColor(.red)
            }
            Spacer(minLength: 20)
            HStack {
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    let shape = RoundedRectangle(cornerRadius: 25)
    var body: some View {
        ZStack {
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill().foregroundColor(.red)
            }
        }
        .padding()
        .foregroundColor(.red)
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
