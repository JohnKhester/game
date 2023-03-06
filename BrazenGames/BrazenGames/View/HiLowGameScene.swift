//
//  HiLowGameScene.swift
//  BrazenGames
//
//  Created by Andrey on 26.02.2023.
//

import SwiftUI




struct HiLowGameScene: View {
    @ObservedObject var chipViewModel = ChipViewModel()
    @ObservedObject var gameModel = Dice()
    @ObservedObject var model = CardGameModel()
    @State private var showDice = false
    @State private var isShowingLobby = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                VStack {
                    LineNavBar()
                        .padding(.top, 42)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<6) { _ in
                                CardHistoryView()
                            }
                        }
                        
                    }
                    .padding(.leading, 24)
                    .padding(.top, 4)
                    .padding(.bottom, -16)
                    ZStack {
                        TableGame()
                        VStack {
                            // Bet
                            Bet(chipViewModel: chipViewModel)
                                .padding(.bottom, 14)
                            
                            // Card Game
                            HStack(spacing: 45) {
                                if let cardRanks = gameModel.getCardRanks() {
                                    if cardRanks.count == 1 {
                                        // Show the single card rolled
                                        PlayingCardView(rank: cardRanks[0], suit: gameModel.cardSuits[(gameModel.dieOne + gameModel.dieTwo) % 4])
                                    } else {
                                        if let selectedRank = gameModel.selectedRank {
                                            PlayingCardView(rank: selectedRank, suit: gameModel.cardSuits[(gameModel.dieOne + gameModel.dieTwo) % 4])
                                        } else {
                                            EmptyCardFrame()
                                        }
                                    }
                                }else {
                                    EmptyCardFrame()
                                }
                                ZStack {
                                    BackSidePlayingCard()
                                    if model.isShowingRandomCard {
                                        
                                        RandomPlayingCardView(rank: model.randomCard!, suit: gameModel.cardSuits[(gameModel.dieOne + gameModel.dieTwo) % 4])
                                                .offset(x: -20)
                                         
                                    }
                
                                }
                                
                                
                            } .padding(.bottom, 8)
                            
                            // Button Hi and Low
                            HStack {
                                Button(action: {
                                    self.model.showRandomCard()
                                    self.gameModel.buttonsHighLow = true
                                }) {
                                    Text("High")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    
                                }.frame(minWidth: 140, maxWidth: .infinity, minHeight: 50)
                                    .background(Color.primary)
                                    
                                    .cornerRadius(10)
                                    .disabled(!self.gameModel.buttonsHighLow || self.gameModel.selectCard)
                                
                                Button(action: {
                                    //
                                }) {
                                    Text("Low")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    
                                }.frame(minWidth: 140, maxWidth: .infinity, minHeight: 50)
                                    .background(Color.primary)
                                    .opacity(0.12)
                                    .cornerRadius(10)
                            }
                            .frame(width: 191)
                            // Information Place Bets
                            VStack {
                                Text("Place your bets")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .bold))
                            }
                            
                            // Dice
                            VStack {
                                
                                if showDice {
                                    HStack {
                                        Image(uiImage: gameModel.imageDice[gameModel.dieOne - 1])
                                        Image(uiImage: gameModel.imageDice[gameModel.dieTwo - 1])
                                    }.padding(.bottom, 20)
                                }
                            }
                        }
                        // User Pick
                        VStack {
                            UserPick()
                            BetStatus()
                            Text("John Doy")
                                .foregroundColor(.yellow)
                                .font(.system(size: 14, weight: .medium))
                            Text("$ \(chipViewModel.balance)")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .offset(x: -148, y: 122)
                    }
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            gameModel.rollDice() // Call rollDice method on gameModel object
                            showDice = true
                            self.gameModel.buttonsHighLow = true
                        }, label: {
                            Text("Roll Dice")
                                .font(.system(size: 15))
                            //.foregroundColor(.white)
                        })
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.805301249, green: 0.6478652959, blue: 0.1017915167, alpha: 1)), Color(#colorLiteral(red: 0.8620405793, green: 0.5370776658, blue: 0.2003901303, alpha: 1))]), startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(16)
                        .shadow(color: .white.opacity(0.46), radius: 2, x: 0, y: 1)
                        .padding(.horizontal, 24)
                        .disabled(chipViewModel.betAmount == 0)
                        .padding(.top, -12)
                        HStack(spacing: 24) {
                            Button(action: {
                                chipViewModel.clearBet()
                                showDice = false
                            }, label: {
                                Text("Clear")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 52)
                                    .background(Color.darkColor)
                                    .cornerRadius(16)
                            })
                            
                            Button(action: {
                                if chipViewModel.doubleBet() {
                                    print("Ставка была удвоена")
                                } else {
                                    print("Ставка не была удвоена")
                                }
                                
                            }, label: {
                                Text("Double")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 52)
                                    .background(Color.darkColor)
                                    .cornerRadius(16)
                                
                            })
                            
                            .disabled(chipViewModel.betAmount == 0)
                            //.disabled(!viewModel.canDoubleBet)
                        }
                        .padding(.leading, 24)
                        .padding(.trailing, 24)
                        .padding(.bottom, 12)
                        ChipsComponents(chipViewModel: chipViewModel)
                            .padding(.leading, 24)
                    }
                    .padding(.bottom, 24)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Button(action: {
                    // Action to go back
                    self.isShowingLobby = true
                }, label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                }),
                trailing: Button(action: {
                    // Action for filter button
                }, label: {
                    Image(systemName: "slider.horizontal.3")
                        .foregroundColor(.white)
                })
            )
            .navigationDestination(isPresented: $isShowingLobby) {
                Lobby()
            }
        }
    }
    
}


struct HiLowGameScene_Previews: PreviewProvider {
    static var previews: some View {
        HiLowGameScene()
    }
}
