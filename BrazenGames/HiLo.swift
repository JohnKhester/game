//
//  HiLo.swift
//  BrazenGames
//
//  Created by Andrey on 12.02.2023.
//

import SwiftUI


struct CardGameView: View {
    @State private var yourBet: Int = 0
    @State private var myBalance: Int = 1000
    @State private var isDeckEnabled: Bool = false
    
    var body: some View {
        VStack {
            Text("Your Bet: \(yourBet)")
            Text("My Balance: \(myBalance)")
            Spacer()
            HStack {
                if isDeckEnabled {
                    // Show a random card image in the empty card space based on dice roll
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(width: 77, height: 118)
                        .shadow(radius: 5)
                } else {
                    // Show the deck with an inverted shirt
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(width: 77, height: 118)
                        .shadow(radius: 5)
                }
            }
             Text("Place your bet")
                .padding(30)
            if yourBet == 0 {
                            Button(action: {
                                // Bet 10 bucks
                                yourBet = 10
                            }) {
                                Text("Bet 10 bucks")
                            }
                            .padding()
                            Button(action: {
                                // Bet 20 bucks
                                yourBet = 20
                            }) {
                                Text("Bet 20 bucks")
                            }
                            .padding()
            } else {
                // Allow throwing the cup only if a bet is placed
                Button(action: {
                    // Roll the dice to get a card
                }) {
                    Text("Throw cup")
                }
                .padding()
            }
        }
    }
}


struct CardGameView_Previews: PreviewProvider {
    static var previews: some View {
        CardGameView()
    }
}


