//
//  HomeView.swift
//  TravelApp
//
//  Created by DarkRader on 22.08.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var isActive: Bool = true
    
    var body: some View {
        ZStack {
            if isActive {
                SplashScreen()
            } else {
                CustomTabBarView()
            }
        }
        .onAppear(perform: {
            withAnimation(.easeInOut(duration: 1).delay(5)) {
                isActive.toggle()
            }
        })
    }
}

struct HomeChapters: View {
    @State var show = false
    @State private var searchText = ""
    
    var searchBar: some View {
        HStack {
            TextField("Search...", text: $searchText)
                .padding(10)
                .foregroundColor(.black.opacity(0.6))
            
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding(.trailing, 8)
        }
        .padding(.leading, 8)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color.white.opacity(0.2).gradient)
        )
        .background(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.white.opacity(0.5), lineWidth: 1)
        )
    }
    
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                HStack(spacing: 10) {
                    Text("Hi, David 👋\n\(Text("Explore the world..").foregroundColor(.white.opacity(0.5)).font(.system(size: 17)))")
                        .font(.system(size: 25))
                        .foregroundColor(.white.opacity(0.9))
                    Spacer()
                    Image(systemName: "person.circle")
                        .font(.system(size: 40))
                        .foregroundStyle(.orange, .white.opacity(0.3))
                }
                .padding(.horizontal, 20)
                
                searchBar.padding(.horizontal, 20)
                
                ButtonView()
                
                HStack {
                    Text("Popular places")
                        .font(.system(size: 20))
                        .foregroundColor(.white.opacity(0.9))
                        .padding(.vertical, 30)
                    Spacer()
                    Text("View all")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                        .padding(.vertical, 30)
                        .bold()
                }
                .padding(.horizontal, 20)
                
                CardView(showButton: true, onlyButtonCntrl: true)
                
                Spacer()
            }
        }
    }
}

struct ButtonElement: Identifiable {
    var id: UUID = UUID()
    var name: String
}

struct ButtonView: View {
    @State private var buttonAr: [ButtonElement] =
    [ ButtonElement(name: "Most Viewed"), ButtonElement(name: "Nearby"), ButtonElement(name: "Latest"),
        ButtonElement(name: "Favourite"), ]
    
    var body: some View {
        HStack {
            Grid {
                GridRow {
                    ForEach(buttonAr.indices, id: \.self) { number in
                        Button(action: {}) {
                            Text(buttonAr[number].name)
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white.opacity(0.15)))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
