//
//  HighLow.swift
//  BrazenGames
//
//  Created by Andrey on 12.02.2023.
//

import SwiftUI
import AVFoundation

struct HighLow: View {
    @ObservedObject var chipViewModel = ChipViewModel()
    @ObservedObject var gameModel = Dice()
    @State private var showDice = false
    
    var deck = createDeck()
    var body: some View {
        VStack {
            Text("Balance: \(chipViewModel.balance)")
            Text("Bet: \(chipViewModel.betAmount)")
                        Button(action: {
                            chipViewModel.clearBet()
                            showDice = false
                        }, label: {
                            Text("Clear Bet")
                        })
                            .padding(.top, 20)
            if showDice {
                HStack {
                    Image(uiImage: gameModel.imageDice[gameModel.dieOne - 1])
                    Image(uiImage: gameModel.imageDice[gameModel.dieTwo - 1])
                }
            }
            
            Button(action: {
                if chipViewModel.doubleBet() {
                    //
                } else {
                    //
                }
            }, label: {
                Text("Double")
            })
            .disabled(chipViewModel.betAmount == 0)
            
            Button(action: {
                gameModel.rollDice() // Call rollDice method on gameModel object
                showDice = true
            }, label: {
                Text("Roll Dice")
            }).disabled(chipViewModel.betAmount == 0)
            
            ChipsComponents(chipViewModel: chipViewModel)
            
        }
        .padding()
    }
}
 


struct HighLow_Previews: PreviewProvider {
    static var previews: some View {
        HighLow()
    }
}

