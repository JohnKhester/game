//
//  RandomPlayingCardView.swift
//  BrazenGames
//
//  Created by Andrey on 06.03.2023.
//

import SwiftUI

struct RandomPlayingCardView: View {
    let rank: String
    let suit: String
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.5), radius: 1, x: 0, y: 1)
                VStack {
                    VStack {
                        Text(rank)
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(suitColor())
                        
                        Image(systemName: suitSymbol())
                            .font(.system(size: 15))
                            .foregroundColor(suitColor())
                    }
                    .offset(x: -30, y: 6)
                    ZStack {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(lineWidth: 2)
                            .opacity(0.12)
                            .frame(width: 34, height: 52)
                        Image(systemName: suitSymbol())
                            .font(.system(size: 16))
                            .foregroundColor(suitColor())
                    }
                    VStack {
                        Image(systemName: suitSymbol())
                            .font(.system(size: 15))
                            .scaleEffect(x: 1, y: -1)
                            .foregroundColor(suitColor())
                            
                        Text(rank)
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(suitColor())
                            .scaleEffect(x: -1, y: 1)
                    }
                    .offset(x: 30, y: -6)
                }
            }
            .frame(width: 96, height: 138)
            
    }
    func suitColor() -> Color {
        switch suit {
        case "♠️", "♣️":
            return Color.black
        default:
            return Color.red
        }
    }
    
    func suitSymbol() -> String {
        switch suit {
        case "♠️":
            return "suit.spade.fill"
        case "♣️":
            return "suit.club.fill"
        case "♥️":
            return "suit.heart.fill"
        case "♦️":
            return "suit.diamond.fill"
        default:
            return ""
        }
    }
}

struct RandomPlayingCardView_Previews: PreviewProvider {
    static var previews: some View {
        RandomPlayingCardView(rank: "3", suit: "♠️")
    }
}
