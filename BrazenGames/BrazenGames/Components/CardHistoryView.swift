//
//  CardHistoryView.swift
//  BrazenGames
//
//  Created by Andrey on 28.02.2023.
//

import SwiftUI

struct CardHistoryView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 6) {
                Text("Round")
                    .foregroundColor(.white)
                    .font(.system(size: 11, weight: .medium))
                Text("Round")
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
            }
            Spacer()
            HStack(spacing: 24) {
                PlayingCardView(rank: "3", suit: "♥️")
                PlayingCardView(rank: "3", suit: "♥️")
                
            }.scaleEffect(0.4)
            
        }
        .frame(width: 156, height: 57)
        .padding(16)
        .background(Color(red: 0.13, green: 0.14, blue: 0.16, opacity: 1.0))
        .cornerRadius(12)
    }
}

struct CardHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        CardHistoryView()
    }
}
