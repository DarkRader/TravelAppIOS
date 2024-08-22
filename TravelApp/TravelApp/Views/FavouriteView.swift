//
//  FavouriteView.swift
//  TravelApp
//
//  Created by DarkRader on 22.08.2024.
//

import SwiftUI

struct FavouriteView: View {
    @State var favouriteAr: [FavouriteElement] =
    [
        FavouriteElement(name: "Tower Bridge", desc: "London, United Kingdom"),
        FavouriteElement(name: "The Statue of Liberty", desc: "Liberty Island, New York Harbor"),
        FavouriteElement(name: "Eiffel Tower", desc: "Paris, France"),
    ]
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(favouriteAr.indices, id: \.self) { number in
                    Button(action: {}) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.white.opacity(0.1))
                                .frame(height: 80)
                            HStack{
                                Image(systemName: "heart.fill")
                                    .font(.system(size: 25))
                                    .foregroundColor(.red)
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(favouriteAr[number].name)
                                            .font(.system(size: 18))
                                            .foregroundColor(.white)
                                        Text(favouriteAr[number].desc)
                                            .font(.system(size: 13))
                                            .foregroundColor(.white)
                                    }
                                    Spacer()
                                }
                            }
                            .padding(.horizontal, 10)
                        }
                    }
                }
                Spacer()
            }
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
    }
}

struct FavouriteElement: Identifiable {
    var id: UUID = UUID()
    var name: String
    var desc: String
}

#Preview {
    FavouriteView()
}
