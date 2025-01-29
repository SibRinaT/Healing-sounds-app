//
//  ContentView.swift
//  HealingSounds
//
//  Created by Ainur on 28.01.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Выберите звуковую\n терапию")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("TextColor"))
                    .font(.custom("MontserratAlternates-Regular", size: 24))
                Image("") // find button
            }
            ScrollView(.horizontal) {
                Image("AlphaImage")
                
            }
        }
        .padding()
    }
}

#Preview {
    MainView()
}
