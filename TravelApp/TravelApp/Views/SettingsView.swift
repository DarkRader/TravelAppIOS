//
//  SettingsView.swift
//  TravelApp
//
//  Created by DarkRader on 22.08.2024.
//

import SwiftUI

struct SettingsView: View {
    @State var settingsAr: [SettingElement] =
    [
        SettingElement(name: "Notifications", desc: "Notification permissions"),
        SettingElement(name: "Rate US", desc: "Support us by rating us"),
        SettingElement(name: "Share App", desc: "Share with your friends and loved ones."),
        SettingElement(name: "Remove ADS", desc: "Access premium features with purchase"),
        SettingElement(name: "Other Apps", desc: "Check out our other apps"),
    ]
    
    var body: some View {
        VStack(spacing: 40) {
            ForEach(settingsAr.indices, id: \.self) { number in
                Button(action: {}) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(settingsAr[number].name)
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                            Text(settingsAr[number].desc)
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                        }
                        .opacity(0.8)
                        Spacer()
                    }
                }
            }
            Spacer()
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
    }
}

struct SettingElement: Identifiable {
    var id: UUID = UUID()
    var name: String
    var desc: String
}

#Preview {
    SettingsView()
}
