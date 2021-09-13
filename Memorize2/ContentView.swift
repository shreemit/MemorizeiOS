//
//  ContentView.swift
//  Memorize2
//
//  Created by Shreemit on 13/09/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        return RoundedRectangle(cornerRadius: 42).stroke().padding(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
