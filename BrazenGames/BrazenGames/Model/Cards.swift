//
//  Cards.swift
//  BrazenGames
//
//  Created by Andrey on 12.02.2023.
//

import Foundation
import SwiftUI

struct Card {
    enum Suit: String, CaseIterable {
        case spades = "♠"
        case hearts = "♥"
        case diamonds = "♦"
        case clubs = "♣"
    }

    enum Rank: String, CaseIterable {
        case ace = "A"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case ten = "10"
        case jack = "J"
        case queen = "Q"
        case king = "K"
    }
    
    let suit: Suit
    let rank: Rank
    let image: Image
}
 
func createDeck() -> [Card] {
    var deck: [Card] = []
    
    for suit in Card.Suit.allCases {
        for rank in Card.Rank.allCases {
            let imageName = "\(rank.rawValue)\(suit.rawValue)"
            if let image = UIImage(named: imageName) {
                let card = Card(suit: suit, rank: rank, image: Image(uiImage: image))
                deck.append(card)
            }
        }
    }
    
    return deck
}



