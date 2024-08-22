//
//  LocationView.swift
//  TravelApp
//
//  Created by DarkRader on 22.08.2024.
//

import SwiftUI
import MapKit

struct LocationView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: "map.fill")
                        .font(.system(size: 35))
                        .foregroundStyle(.white.gradient)
                    
                    Text("Select \(Text("Location").foregroundStyle(.white.gradient))\n\(Text("For travel plans").font(.system(size: 15)).foregroundStyle(.yellow.gradient))")
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.orange.gradient)
                        .font(.system(size: 18))
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                
                Map()
                    .cornerRadius(30)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .foregroundColor(.black.opacity(0.8))
                            .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                    )
                    .padding(.horizontal, 25)
                    .padding(.vertical, 10)
                
                Button(action: {} ) {
                    ZStack {
                        Image("london")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 100)
                            .opacity(0.7)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
                .shadow(color: .black.opacity(0.8), radius: 5, x: 0.0, y: 0.0)
                .padding(.horizontal, 30)
                .padding(.bottom, 10)
                
                Button(action: {}) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 200, height: 35)
                            .foregroundColor(.white.opacity(0.15))
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.orange)
                            .frame(width: 200, height: 35)
                            .blur(radius: 5)
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.orange)
                            .frame(width: 200, height: 35)
                        Text("Save Location")
                            .font(.system(size: 18))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .font(.system(size: 18))
                    }
                }
                .padding(.bottom, 60)
            }
        }
    }
}

#Preview {
    LocationView()
}
