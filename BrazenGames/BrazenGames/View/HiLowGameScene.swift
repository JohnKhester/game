//
//  HiLowGameScene.swift
//  BrazenGames
//
//  Created by Andrey on 26.02.2023.
//

import SwiftUI

struct HiLowGameScene: View {
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
                            Bet(bet: 900)
                                .offset(y: -175)
                            VStack {
                                HStack(spacing: 45) {
                                    PlayingCardView(rank: "3", suit: "♥️")
                                    BackSidePlayingCard()
                                }
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
                                .frame(width: 291)
                                Text("Place your bets")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .bold))
                            }
                            .offset(y: -26)
                            
                            
                        }
                        VStack {
                            UserPick()
                            BetStatus()
                            Text("John Doy")
                                .foregroundColor(.yellow)
                                .font(.system(size: 14, weight: .medium))
                            Text("$109,90")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .offset(x: -148, y: 142)
                    }
                    Spacer()
                    
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
