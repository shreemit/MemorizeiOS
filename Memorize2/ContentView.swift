//
//  ContentView.swift
//  Memorize2
//
//  Created by Shreemit on 13/09/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 42)
                .stroke()
            Text("Placeholder")
        }
            .padding()
            .foregroundColor(.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
