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
        ZStack {
            // Background color
            Color.black.ignoresSafeArea(.all)
            
            Button {
                self.isShowingNewScreen = true
            } label: {
                Text("Press Game")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding()
            .offset(y: 100)
            
        }
    }
}

struct Lobby_Previews: PreviewProvider {
    static var previews: some View {
        Lobby()
    }
}
