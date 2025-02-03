//
//  TabView.swift
//  HealingSounds
//
//  Created by Ainur on 03.02.2025.
//

import SwiftUI

struct TabViewTest: View {
        var emojis: [String] = [ "👻", "🐱", "🦊"]

        var body: some View {
            TabView() {
                ForEach(0..<emojis.endIndex) { index in
                    Text(emojis[index])
                        .font(.system(size: 150))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 250)
                        .background(Color("RectangleColor"))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding()
                        .tabItem {
                            Text(emojis[index])
                        }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

#Preview {
    TabViewTest()
}
