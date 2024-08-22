//
//  CardView.swift
//  TravelApp
//
//  Created by DarkRader on 22.08.2024.
//

import SwiftUI

struct CardView: View {
    @State private var place: Place?
    var rectWidth: CGFloat = 200
    var rectHeight: CGFloat = 300
    var showButton: Bool = false
    var onlyButtonCntrl: Bool = false
    
    let places: [Place] = [
        Place(name: "London", image: "london"),
        Place(name: "Parise", image: "paris"),
        Place(name: "New York", image: "nyc"),
        Place(name: "Barcelona", image: "barcelona"),
        Place(name: "Dubai", image: "dubai"),
        Place(name: "Rome", image: "rome"),
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(places) { place in
                            VStack {
                                Image(place.image)
                                    .resizable()
                                    .cornerRadius(15)
                                    .frame(width: rectWidth, height: rectHeight)
                                    .shadow(radius: 10, y: 10)
                                
                                Text(place.name)
                                    .font(.system(size: 20))
                                    .foregroundStyle(.white.opacity(0.9).gradient)
                                    .padding(.top, 5)
                            }
                            .scrollTransition(topLeading: .interactive,
                                              bottomTrailing: .interactive,
                                              axis: .horizontal) { effect, phase in
                                effect.scaleEffect(1 - abs(phase.value))
                                    .opacity(1 - abs(phase.value))
                                    .rotation3DEffect(.degrees(phase.value * 90),
                                                      axis: (x: 0, y: 1, z: 0))
                            }
                            .onTapGesture {
                                withAnimation {
                                    self.place = place
                                }
                            }
                        }
                    }
                    .scrollTargetLayout()
                }
                .frame(height: rectHeight)
                .safeAreaPadding(.horizontal, 32)
                .scrollClipDisabled()
                .scrollTargetBehavior(.viewAligned)
                .scrollPosition(id: $place)
                .onAppear(perform: {
                    place = places[0]
                })
                
                if onlyButtonCntrl && showButton {
                    Rectangle()
                        .frame(height: rectHeight)
                        .foregroundColor(.white.opacity(0.01))
                }
            }
            
            if showButton {
                HStack {
                    Button {
                        withAnimation {
                            guard let place, let index = places.firstIndex(of: place),
                                  index > 0 else { return }
                            self.place = places[index - 1]
                        }
                    } label: {
                        Image(systemName: "arrow.left.square.fill")
                            .font(.system(size: 32))
                    }
                    .foregroundColor(place != places.first ? .white.opacity(0.8) : .gray.opacity(0.3))
                    .disabled(place == places.first)
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            guard let place, let index = places.firstIndex(of: place),
                                  index < places.count - 1 else { return }
                            self.place = places[index + 1]
                        }
                    } label: {
                        Image(systemName: "arrow.right.square.fill")
                            .font(.system(size: 32))
                    }
                    .foregroundColor(place != places.last ? .white.opacity(0.8) : .gray.opacity(0.3))
                    .disabled(place == places.last)
                }
                .padding(32)
            }
            
            Spacer()
        }
    }
}

struct Place: Hashable, Identifiable {
    var id: Self { self }
    
    let name: String
    let image: String
}

#Preview {
    CardView()
        
}
