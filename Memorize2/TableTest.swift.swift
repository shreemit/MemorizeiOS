//
//  TableTest.swift.swift
//  Memorize2
//
//  Created by Shreemit on 12/11/21.
//

import SwiftUI

// form swiftui
struct TableTest: View {
	@State private var isPresented = true
	var body: some View {
		NavigationView {
			VStack {
				Text("Hello, World!")
					.navigationBarTitle("SwiftUI")
				Button("Show me more") {
					self.isPresented.toggle()
				}
				.sheet(isPresented: $isPresented) {
					Text("Hello, World!")
				}
			}
		}
	}
}
