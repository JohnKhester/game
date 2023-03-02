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
    @State private var showDice = false
    @State private var isShowingLobby = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                VStack {
                    LineNavBar()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<6) { _ in
                                    CardHistoryView()
                                }
                            }
                        }.padding(.top, 8)
                         .padding(.leading, 24)
                    ZStack {
                        ZStack {
                            TableGame()
                            VStack {
                                Bet(chipViewModel: chipViewModel)
                                    .padding(.bottom, 14)
                                HStack(spacing: 45) {
                                    PlayingCardView(rank: "3", suit: "♥️")
                                    BackSidePlayingCard()
                                } .padding(.bottom, 14)
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
                                VStack {
                                    Text("Place your bets")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .bold))

                                }
                                if showDice {
                                    HStack {
                                        Image(uiImage: gameModel.imageDice[gameModel.dieOne - 1])
                                        Image(uiImage: gameModel.imageDice[gameModel.dieTwo - 1])
                                    }.padding(.bottom, 20)
                                   
                                }

                            }
                             
                           
                        }
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
                        .offset(x: -148, y: 142)
                        
                    }
                    Spacer()
                    Button(action: {
                        gameModel.rollDice() // Call rollDice method on gameModel object
                        showDice = true
                    }, label: {
                        Text("Roll Dice")
                            .font(.system(size: 15))
                            //.foregroundColor(.white)
                    })
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.805301249, green: 0.6478652959, blue: 0.1017915167, alpha: 1)), Color(#colorLiteral(red: 0.8620405793, green: 0.5370776658, blue: 0.2003901303, alpha: 1))]), startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(16)
                    .shadow(color: .white.opacity(0.46), radius: 2, x: 0, y: 1)
                    .padding(.horizontal, 24)
                    .disabled(chipViewModel.betAmount == 0)
                   
                    
                    ChipsComponents(chipViewModel: chipViewModel)
                    .padding(.leading, 24)
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
