//
//  DiceRollGameView.swift
//  BrazenGames
//
//  Created by Andrey on 12.02.2023.
//


import SwiftUI

class DiceRollGameModel: ObservableObject {
    @Published var dieOne: Int = 0
    @Published var dieTwo: Int = 0
    @Published var isCardSelected: Bool = false
    @Published var selectedRank: String? = nil
    @Published var selectCard: Bool = false
    
    private var numCardsDrawn = 0
    
    let cardSuits = ["♠️", "♣️", "♥️", "♦️"]
    let cardRanks = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Joker"]
    
    func rollDice() {
        dieOne = Int.random(in: 1...6)
        dieTwo = Int.random(in: 1...54)
    }
    
    func getCardRanks() -> [String]? {
        switch (dieOne + dieTwo) {
        case 2:
            return ["2", "Jack"]
        case 3:
            return ["3", "Queen"]
        case 4:
            return ["4", "King"]
        case 10:
            return ["10"]
        case 11:
            return ["Joker", "Ace"]
        case 12:
            return ["Joker"]
        default:
            if let rank = cardRanks.first(where: { $0.prefix(1) == String(dieOne + dieTwo) }) {
                return [rank]
            } else {
                return nil
            }
        }
    }
}

struct DiceRollGameView: View {
    @ObservedObject var gameModel = DiceRollGameModel()
    var body: some View {
        VStack {
            HStack {
                // Empty card or selected card
                if let cardRanks = gameModel.getCardRanks() {
                    if cardRanks.count == 1 {
                        // Show the single card rolled
                        PlayingCardView(rank: cardRanks[0], suit: gameModel.cardSuits[(gameModel.dieOne + gameModel.dieTwo) % 4])
                            .frame(width: 77, height: 118)
                            .padding()
                    } else {
                        if let selectedRank = gameModel.selectedRank {
                            PlayingCardView(rank: selectedRank, suit: gameModel.cardSuits[(gameModel.dieOne + gameModel.dieTwo) % 4])
                                .frame(width: 77, height: 118)
                                .padding()
                        } else {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .shadow(radius: 5)
                            }
                            .frame(width: 77, height: 118)
                            .padding()
                        }

                    }
                }else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .shadow(radius: 5)
                    }
                    .frame(width: 77, height: 118)
                    .padding()
                }

               
                // My Coloda
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black)
                        .shadow(radius: 5)
                }
                .frame(width: 77, height: 118)
            }
            HStack {
                DieView(value: gameModel.dieOne)
                DieView(value: gameModel.dieTwo)
            }
            Text("You rolled:")
            if let cardRanks = gameModel.getCardRanks() {
                if cardRanks.count == 1 {
                } else {
                    // Multiple cards rolled, display them and allow the user to choose one
                    HStack {
                        ForEach(cardRanks, id: \.self) { rank in
                             
                                PlayingCardView(rank: rank, suit: gameModel.cardSuits[(gameModel.dieOne + gameModel.dieTwo) % 4])
                                
                                    .onTapGesture {
                                        if self.gameModel.isCardSelected {
                                            self.gameModel.selectedRank = rank
                                            
                                        } else {
                                            self.gameModel.isCardSelected = true
                                            self.gameModel.selectedRank = rank
                                            
                                        }
                                    }
                                    .opacity(gameModel.isCardSelected ? 0.6 : 1.0)
                                    .disabled(gameModel.isCardSelected)
                        }
                    }
                }
            } else {
                Text("You rolled \(gameModel.dieOne + gameModel.dieTwo)")
            }
               
            Button(action: {
                self.gameModel.dieOne = Int.random(in: 1...6)
                self.gameModel.dieTwo = Int.random(in: 1...6)
            }) {
                Text("Roll Dice")
            }.disabled(gameModel.isCardSelected)

        }
    }

    
}

struct DieView: View {
    let value: Int
    var body: some View {
        Text(String(value))
            .font(.system(size: 100))
            .padding()
    }
}

struct PlayingCardView: View {
    let rank: String
    let suit: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(radius: 5)
            
            VStack {
                Text(rank)
                    .font(.largeTitle)
                    .foregroundColor(suitColor())
                                    
                Image(systemName: suitSymbol())
                    .font(.largeTitle)
                    .foregroundColor(suitColor())
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
        .frame(width: 77, height: 118)
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



struct DiceRollGameView_Previews: PreviewProvider {
    static var previews: some View {
        DiceRollGameView()
    }
}
