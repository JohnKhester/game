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
                    ZStack {
                        TableGame()
                        Bet(bet: 900)
                            .offset(y: -160)
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
                        }
                        .offset(y: -26)
                    }
                   
                    
                    Text("Have the style touching the safe area edge.")
                        .padding()
                        
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
