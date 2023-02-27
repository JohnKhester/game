//
//  BackSidePlayingCard.swift
//  BrazenGames
//
//  Created by Andrey on 27.02.2023.
//

import SwiftUI

struct BackSidePlayingCard: View {
    var body: some View {
        ZStack {
            Image("BackSideCards")
                .aspectRatio(CGSize(width: 96, height: 143), contentMode: .fit)
        }
        .frame(width: 96, height: 138)
        .shadow(color: Color.black.opacity(0.5), radius: 29, x: 20, y: 1)
    }
}

struct BackSidePlayingCard_Previews: PreviewProvider {
    static var previews: some View {
        BackSidePlayingCard()
    }
}
