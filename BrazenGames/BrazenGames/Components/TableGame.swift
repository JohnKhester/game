//
//  TableGame.swift
//  BrazenGames
//
//  Created by Andrey on 26.02.2023.
//

import SwiftUI

struct TableGame: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 69 + 1)
                .fill(RadialGradient(gradient: Gradient(colors: [Color(red: 94/255, green: 188/255, blue: 94/255), Color.green]), center: .center, startRadius: 0, endRadius: 200))
                .frame(height: 440)
            
            RoundedRectangle(cornerRadius: 48 + 1)
                .stroke(Color.white.opacity(0.14), lineWidth: 2)
                .foregroundColor(Color.white)
                .frame(height: 382)
                .padding(32)
            
            RoundedRectangle(cornerRadius: 69 + 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color.startStroke, Color.endStroke]), startPoint: .top, endPoint: .bottom), lineWidth: 18)
                .shadow(color: Color.black.opacity(0.5), radius: 53, x: 0, y: 2)
                .background(Color.clear)
                .frame(height: 440)
        }
        .shadow(color: Color.black.opacity(0.22), radius: 53, x: 18, y: 48)
        .padding(24)
    }
}

struct TableGame_Previews: PreviewProvider {
    static var previews: some View {
        TableGame()
    }
}
