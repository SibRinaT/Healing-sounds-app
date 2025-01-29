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

    var body: some View {
        VStack {
            Rectangle()
                .cornerRadius(16)
                .foregroundColor(Color("RectangleColor"))
                .frame(height: 165)
                .overlay {
                    VStack {
                        ZStack(alignment: .bottom) {
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
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            
                            Image("WaveImage")
                                .resizable()
                                .frame(height: 100)
                                .ignoresSafeArea(.container)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                                               .clipped()
                        }
                    }
                }
        }
        .padding()
    }
}

#Preview {
    WaveRectangleView(title: "Альфа-волны", tag: "Сознательное", tag2: "Бодрствование")
}
