//
//  CustNavBar.swift
//  BrazenGames
//
//  Created by Andrey on 05.03.2023.
//

import SwiftUI

struct CustomNavigationView: View {
    @ObservedObject var chipViewModel = ChipViewModel()
    @ObservedObject var gameModel = Dice()
    @State private var showDice = false
    @State private var isShowingLobby = false
    var body: some View {
        NavigationView {
            ZStack {
                Color.red
                VStack {
                    LineNavBar()                       
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<6) { _ in
                                CardHistoryView()
                            }
                        }
                        
                    }
                    .padding(.leading, 24)
                    .padding(.top, 4)
                    ZStack {
                        TableGame()
                        VStack {
                            // Bet
                            Bet(chipViewModel: chipViewModel)
                                .padding(.bottom, 14)
                            
                            // Card Game
                            HStack(spacing: 45) {
                                PlayingCardView(rank: "3", suit: "♥️")
                                BackSidePlayingCard()
                            } .padding(.bottom, 8)
                            
                            // Button Hi and Low
                            HStack {
                                Button(action: {
                                    //
                                }) {
                                    Text("High")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    
                                }.frame(minWidth: 140, maxWidth: .infinity, minHeight: 50)
                                    .background(Color.primary)
                                    .opacity(0.12)
                                    .cornerRadius(10)
                                
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
                            .padding(.bottom, 20)
                            
                            // Information Place Bets
                            VStack {
                                Text("Place your bets")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .bold))
                            }
                            // Dice
                            if showDice {
                                HStack {
                                    Image(uiImage: gameModel.imageDice[gameModel.dieOne - 1])
                                    Image(uiImage: gameModel.imageDice[gameModel.dieTwo - 1])
                                }.padding(.bottom, 20)

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
                        .padding(.top, -16)
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            gameModel.rollDice() // Call rollDice method on gameModel object
                            showDice = true
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
                        
                        HStack(spacing: 24) {
                            Button(action: {
                                chipViewModel.clearBet()
                                showDice = false
                            }, label: {
                                Text("Clear")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 52)
                                    .background(
                                        Color(red: 0.18, green: 0.18, blue: 0.19)
                                    )
                                    .cornerRadius(16)
                            })
                           
                            Button(action: {
                                chipViewModel.doubleBet()
                                showDice = false
                            }, label: {
                                Text("Double")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 52)
                                    .background(
                                        Color(red: 0.18, green: 0.18, blue: 0.19)
                                    )
                                    .cornerRadius(16)
                
                            })
                            
                            .disabled(chipViewModel.betAmount == 0)
                        }
                        .padding(.leading, 24)
                        .padding(.trailing, 24)
                        
                        ChipsComponents(chipViewModel: chipViewModel)
                            .padding(.leading, 24)
                    }
                    .padding(.bottom, 1)
                }
                .padding(.top, 16)
                .navigationBarItems(
                    leading: Button(action: {
                        // Handle left button action
                    }, label: {
                        Text("Left")
                            .foregroundColor(.blue)
                    }),
                    trailing: Button(action: {
                        // Handle right button action
                    }, label: {
                        Text("Right")
                            .foregroundColor(.blue)
                    })
                    
                )
            }
        }
    }
}



struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView()
    }
}
