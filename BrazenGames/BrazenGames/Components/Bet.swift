//
//  Bet.swift
//  BrazenGames
//
//  Created by Andrey on 27.02.2023.
//

import SwiftUI

struct Bet: View {
    var bet: Int = 0
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .frame(height: 43)
                .foregroundColor(Color.black)
                .opacity(0.52)
            HStack {
                Text("Bet:")
                    .foregroundColor(.white)
                Spacer()
                Text("$\(bet)")
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .bold))
            }
            .padding(16)
        }.frame(width: 180, height: 33)
    }
}

struct Bet_Previews: PreviewProvider {
    static var previews: some View {
        Bet()
    }
}
