//
//  ShowCard.swift
//  BrazenGames
//
//  Created by Andrey on 28.02.2023.
//

import SwiftUI

struct Cart: Identifiable  {
    let id = UUID()
    let value: String
    let suit: String
}

class Game: ObservableObject {
    @Published var cards: [Cart] = []
    @Published var history: [(round: Int, card: Cart)] = []
    @Published var round = 1

    func dealCard() -> Cart? {
        let card = Cart(value: "Ace", suit: "Spades") // Replace with your own logic to generate a random card
        cards.append(card)
        history.append((round, card))
        round += 1
        return card
    }

    func getLastTwoCards() -> [Cart] {
        return Array(history.suffix(2).map { $0.card })
    }
}

struct ShowCard: View {
    @ObservedObject var game = Game()
        @State var showHistory = false

    var body: some View {
        VStack {
            Button("Deal Card") {
                _ = game.dealCard()
                showHistory = false
            }
            if showHistory {
                ScrollView(.horizontal) {
//                    HStack {
//                        ForEach(game.history) { card in
//                            CartView(card: card, gameModel: game)
//                        }
//                    }
                }
            } else {
                ForEach(game.getLastTwoCards()) { card in
                    CartView(card: card, gameModel: game)
                }
            }
            Button("Show History") {
                showHistory.toggle()
            }
        }
    }
}

struct CartView: View {
    let card: Cart
    @ObservedObject var gameModel: Game

    var body: some View {
        VStack {
            Text("Round \(gameModel.round)")
            Text(card.value)
            Text(card.suit)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ShowCard_Previews: PreviewProvider {
    static var previews: some View {
        ShowCard()
    }
}
