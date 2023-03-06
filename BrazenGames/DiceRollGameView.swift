//
//  DiceRollGameView.swift
//  BrazenGames
//
//  Created by Andrey on 12.02.2023.
//


import SwiftUI



struct DiceRollGameView: View {
    @ObservedObject var gameModel = Dice()
    @StateObject var model = CardGameModel()
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

                
                
                if model.isShowingRandomCard   {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .shadow(radius: 5)
                        VStack {
                            Text(model.randomCard!)
                                .font(.largeTitle)
                               // .foregroundColor(suitColor())
                            Image(systemName: "\(gameModel.cardRanks)")
                                .font(.largeTitle)
                               // .foregroundColor(suitColor())
                        }
                    }
                    .aspectRatio(2/3, contentMode: .fit)
                    .frame(width: 77, height: 118)
   
                        } else {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.black)
                                    .shadow(radius: 5)
                            }
                            .frame(width: 77, height: 118)
                }
               
                 
     
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
               
            VStack {
                Button(action: {
                    self.gameModel.dieOne = Int.random(in: 1...6)
                    self.gameModel.dieTwo = Int.random(in: 1...6)
                    self.gameModel.buttonsHighLow = true
                }) {
                    Text("Roll Dice")
                }
                .disabled(self.gameModel.isCardSelected)

                Button(action: {
                    self.model.showRandomCard()
                    self.gameModel.buttonsHighLow = true
                }, label: {
                    Text("High")
                })
                .disabled(!self.gameModel.buttonsHighLow || self.gameModel.selectCard)

                Button(action: {
                    self.model.showRandomCard()
                    self.gameModel.buttonsHighLow = true
                }) {
                    Text("Low")
                }
                .disabled(!self.gameModel.buttonsHighLow || self.gameModel.selectCard)

            }.padding(30)
        }
    }
    
}

struct DieView: View {
    let value: Int
    var body: some View {
        Text(String(value))
            .font(.system(size: 40))
            .padding()
    }
}



struct DiceRollGameView_Previews: PreviewProvider {
    static var previews: some View {
        DiceRollGameView()
    }
}
