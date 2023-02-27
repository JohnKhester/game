//
//  Lobby.swift
//  BrazenGames
//
//  Created by Andrey on 26.02.2023.
//

import SwiftUI

struct Lobby: View {
    @State private var isShowingNewScreen = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background color
                Color.backgroundColor.ignoresSafeArea(.all)

                Button(action: {
                    self.isShowingNewScreen = true
                }, label: {
                    Text("Press Game")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                })
                .padding()
                .offset(y: 100)
                
            }
            .navigationDestination(isPresented: $isShowingNewScreen) {
                HiLowGameScene()
            }
        }

    }
}


struct Lobby_Previews: PreviewProvider {
    static var previews: some View {
        Lobby()
    }
}
