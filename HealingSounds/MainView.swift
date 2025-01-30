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
            Text("Выберите звуковую\n терапию")
                .multilineTextAlignment(.center)
                .foregroundColor(Color("TextColor"))
                .font(.custom("MontserratAlternates-Regular", size: 18))
            
            ScrollViewReader { proxy in
                           ScrollView(.horizontal) {
                               HStack(spacing: 0) {
                                   ForEach(0..<3, id: \.self) { index in
                                       WaveRectangleView(title: "Альфа-волны", tag: "Сознательное", tag2: "Бодрствование", image: "WaveImage")
                                       WaveRectangleView(title: "Альфа-волны", tag: "Сознательное", tag2: "Бодрствование", image: "WaveImage")
                                       WaveRectangleView(title: "Альфа-волны", tag: "Сознательное", tag2: "Бодрствование", image: "WaveImage")
                                           .id(index) // Уникальный идентификатор для каждого элемента
                                   }
                               }
                               .scrollTargetLayout() // Указываем, что это целевые элементы для привязки
                           }
                           .scrollTargetBehavior(.paging)
                           .scrollIndicators(.hidden) // Скрываем индикаторы прокрутки
                           .onChange(of: currentPage) { _, newPage in
                               withAnimation {
                                   proxy.scrollTo(newPage, anchor: .center) // Прокрутка к выбранной странице
                               }
                           }
            }
            HStack(spacing: 8) {
                ForEach(0..<3, id: \.self) { index in
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(currentPage == index ? .blue : .gray.opacity(0.5)) // Активная и неактивная точки
                        .onTapGesture {
                            currentPage = index // Переключение на выбранную страницу
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
