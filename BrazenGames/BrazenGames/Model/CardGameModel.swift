//
//  CardGameModel.swift
//  BrazenGames
//
//  Created by Andrey on 05.03.2023.
//

import SwiftUI

class CardGameModel: ObservableObject {
    let cardSuits = ["♠️", "♣️", "♥️", "♦️"]
    var cardRanks = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "Jk"]


    @Published var isShowingRandomCard = false
    @Published var randomCard: String?

    func getRandomCard() -> String {
        let suit = cardSuits.randomElement()!
        let rank = cardRanks.randomElement()!
        return "\(rank) \(suit)"
    }

    func showRandomCard() {
        isShowingRandomCard = true
        randomCard = getRandomCard()
    }

    func hideRandomCard() {
        isShowingRandomCard = false
        randomCard = nil
    }
    
}


