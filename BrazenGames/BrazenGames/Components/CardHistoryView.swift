//
//  CardHistoryView.swift
//  BrazenGames
//
//  Created by Andrey on 28.02.2023.
//

import SwiftUI

struct CardHistoryView: View {
    var body: some View {
        VStack {
            ZStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Round")
                        .foregroundColor(.white)
                        .font(.system(size: 11, weight: .medium))
                    Text("Round")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                }
                
                HStack(spacing: 24) {
                    PlayingCardView(rank: "3", suit: "♥️")
                    PlayingCardView(rank: "3", suit: "♥️")
                    
                }.scaleEffect(0.3)
                
            }
            .frame(width: 156, height: 57)
             
            .background(Color.darkColor)
            .cornerRadius(12)
        }
    }
}

struct CardHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        CardHistoryView()
    }
}
