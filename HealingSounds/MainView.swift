//
//  ContentView.swift
//  HealingSounds
//
//  Created by Ainur on 28.01.2025.
//

import SwiftUI

struct MainView: View {
    @State private var currentPage: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Text("Выберите звуковую\n терапию")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("TextColor"))
                    .font(.custom("MontserratAlternates-Regular", size: 18))
                
                Spacer()
                
                Circle()
                    .foregroundColor(Color("RectangleColor"))
                    .frame(width: 42, height: 42)
                    .overlay(
                        Image("lupaIcon")
                        )
            }
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(0..<3, id: \.self) { index in
                            WaveRectangleView(title: "Альфа-волны", tag: "Сознательное", tag2: "Бодрствование", image: "WaveImage")
                                .id(index)
                                .frame(width: UIScreen.main.bounds.width) // Каждый элемент занимает всю ширину экрана
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.paging)
                .onChange(of: currentPage) { _, newPage in
                    withAnimation {
                        proxy.scrollTo(newPage, anchor: .center)
                    }
                }
                .onAppear {
                    proxy.scrollTo(currentPage, anchor: .center)
                }
                .onChange(of: currentPage) { oldValue, newValue in
                    print("Current page: \(newValue)")
                }
            }
            HStack(spacing: 8) {
                ForEach(0..<3, id: \.self) { index in
                    Circle()
                        .frame(width: currentPage == index ? 17 : 15, height: currentPage == index ? 17 : 15)
                        .foregroundColor(currentPage == index ? .black : .clear)
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: currentPage == index ? 0 : 1)
                        )
                        .onTapGesture {
                            currentPage = index
                        }
                }
            }
        }
        .padding()
    }
}

#Preview {
    MainView()
}
