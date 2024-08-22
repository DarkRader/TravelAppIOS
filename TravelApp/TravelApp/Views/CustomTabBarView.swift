//
//  CustomTabBarView.swift
//  TravelApp
//
//  Created by DarkRader on 22.08.2024.
//

import SwiftUI

struct CustomTabBarView: View {
    @Namespace private var animation
    @State private var selectedTab: TabBarCntrl = .Home
//    @State var colorAr: [Color] = bluePurpGradient
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.indigo.gradient)
                .edgesIgnoringSafeArea(.all)
            
            switch selectedTab {
            case .Home:
                HomeChapters()
                    .transition(.opacity)
            case .Location:
                LocationView()
                    .transition(.opacity)
            case .Favourite:
                FavouriteView()
                    .transition(.opacity)
            case .Settings:
                SettingsView()
                    .transition(.opacity)
            }
            
            VStack {
                Spacer()
                ZStack {
                    HStack {
                        ForEach(TabBarCntrl.allCases, id: \.self) { item in
                            ZStack {
                                VStack {
                                    if selectedTab != item {
                                        Image(systemName: item.displayImage)
                                            .foregroundColor(selectedTab == item ? item.displayColor : .gray.opacity(0.6))
                                            .font(.system(size: 25 - CGFloat(TabBarCntrl.allCases.count - 1)))
                                    } else {
                                        Image(systemName: item.displayImage)
                                            .foregroundColor(selectedTab == item ? item.displayColor : .gray.opacity(0.6))
                                            .font(.system(size: 25 - CGFloat(TabBarCntrl.allCases.count - 1)))
                                            .symbolEffect(.pulse, options:  .repeat(3).speed(3))
                                    }
                                    Text(item.displayName)
                                        .foregroundStyle(.white.gradient)
                                        .font(.system(size: 15 - CGFloat(TabBarCntrl.allCases.count - 1)))
                                        .frame(width: CGFloat(UIScreen.main.bounds.width - 40) /
                                               CGFloat(TabBarCntrl.allCases.count))
                                }
                                if selectedTab == item {
                                    ZStack {
                                        Capsule()
                                            .foregroundColor(item.displayColor)
                                            .frame(height: 3)
                                            .blur(radius: 10)
                                            .matchedGeometryEffect(id: "showLine", in: animation)
                                        Capsule()
                                            .foregroundColor(item.displayColor)
                                            .frame(height: 3)
                                            .matchedGeometryEffect(id: "showLine", in: animation)
                                    }
                                    .frame(width: CGFloat(UIScreen.main.bounds.width - 20) /
                                           CGFloat(TabBarCntrl.allCases.count + 1))
                                    .offset(y: 25)
                                }
                            }
                            .onTapGesture {
                                withAnimation {
                                    selectedTab = item
                                }
                            }
                        }
                    }
                    Capsule()
                        .foregroundColor(.white)
                        .frame(height: 2)
                        .opacity(0.15)
                        .offset(y: 25)
                        .padding(.horizontal, 10)
                }
            }
        }
    }
}

enum TabBarCntrl: CaseIterable {
    case Home, Location, Favourite, Settings
    
    var displayName: String {
        switch self {
        case .Home:
            return "Home"
        case .Location:
            return "Location"
        case .Favourite:
            return "Favourite"
        case .Settings:
            return "Settings"
        }
    }
    
    var displayImage: String {
        switch self {
        case .Home:
            return "house.fill"
        case .Location:
            return "location.north.fill"
        case .Favourite:
            return "heart.fill"
        case .Settings:
            return "gearshape.fill"
        }
    }
    
    var displayColor: Color {
        switch self {
        case .Home:
            return .orange
        case .Location:
            return .pink
        case .Favourite:
            return .green
        case .Settings:
            return .blue
        }
    }
}

#Preview {
    CustomTabBarView()
}
