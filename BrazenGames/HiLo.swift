//
//  HiLo.swift
//  BrazenGames
//
//  Created by Andrey on 12.02.2023.
//

import SwiftUI


struct CardGameView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundColor                    
                    .ignoresSafeArea()
                VStack {
                    Rectangle()
                        .fill(Color.black)
                        .frame(height: 2)
                        .background(
                            Rectangle()
                                .fill(Color.white.opacity(0.01))
                                .offset(y: -1)
                                .blur(radius: 1)
                                .mask(Rectangle())
                                .frame(height: 1)
                        )
                        .background(
                            Rectangle()
                                .fill(Color.white.opacity(0.05))
                                .offset(y: 1)
                                .blur(radius: 1)
                                .mask(Rectangle())
                                .frame(height: 1)
                        )
                        
                    Text("Have the style touching the safe area edge.")
                        .padding()
                        
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Button(action: {
                    // Action to go back
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
        }
    }
}


struct CardGameView_Previews: PreviewProvider {
    static var previews: some View {
        CardGameView()
    }
}


