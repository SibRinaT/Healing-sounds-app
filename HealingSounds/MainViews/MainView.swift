//
//  ContentView.swift
//  HealingSounds
//
//  Created by Ainur on 28.01.2025.
//

import SwiftUI

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
                        // Создаем только 3 страницы
                        ForEach(0..<3, id: \.self) { index in
                            Group {
                                switch index {
                                case 0:
                                    WaveRectangleView(title: "Альфа-волны", tag: "Сознательное", tag2: "Бодрствование", image: "WaveImage")
                                case 1:
                                    WaveRectangleView(title: "Бета-волны", tag: "Дремота", tag2: "Медитация", image: "WaveImage2")
                                case 2:
                                    WaveRectangleView(title: "Тета-волны", tag: "Глубокий гипноз", tag2: "Транс", image: "WaveImage3")
                                default:
                                    EmptyView()
                                }
                            }
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
                .background(
                    GeometryReader { geometry in
                        Color.clear
                            .onAppear {
                                updateCurrentPage(from: geometry)
                            }
                            .onChange(of: geometry.frame(in: .global).minX) { _ in
                                updateCurrentPage(from: geometry)
                            }
                    }
                )
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
    
    private func updateCurrentPage(from geometry: GeometryProxy) {
        let offset = geometry.frame(in: .global).minX
        let pageWidth = UIScreen.main.bounds.width
        let newPage = Int(round(-offset / pageWidth))
        if newPage != currentPage {
            currentPage = newPage
        }
    }
}

#Preview {
    MainView()
}
