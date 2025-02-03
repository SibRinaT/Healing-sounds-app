//
//  WaveRectangleView.swift
//  HealingSounds
//
//  Created by Ainur on 28.01.2025.
//

import SwiftUI

struct WaveRectangleView: View {
    @State var title: String
    @State var tag: String
    @State var tag2: String
    @State var image: String

    var body: some View {
        VStack {
            Rectangle()
                .cornerRadius(16)
                .foregroundColor(Color("RectangleColor"))
                .frame(minWidth: 350, minHeight: 165, maxHeight: 165)
                .overlay {
                    VStack {
                        ZStack(alignment: .bottom) {
                            Image(image)
                                .resizable()
                                .frame(height: 100)
                                .ignoresSafeArea(.container)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .clipped()
                            VStack {
                                Text(title)
                                    .font(.title)
                                    .bold()
                                    .padding(.bottom, 5)
                                Text(tag)
                                    .font(.custom("", size: 18))
                                    .padding(.bottom, 1)
                                Text(tag2)
                                    .font(.custom("", size: 18))
                            }
                            .foregroundColor(Color("TextColor"))
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        }
                    }
                }
        }
        .padding()
    }
}

#Preview {
    WaveRectangleView(title: "Альфа-волны", tag: "Сознательное", tag2: "Бодрствование", image: "WaveImage")
}
