//
//  BetStatus.swift
//  BrazenGames
//
//  Created by Andrey on 28.02.2023.
//

import SwiftUI

struct BetStatus: View {
    @State var betStatus: String = "Your Bet"
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .frame(height: 25)
                .foregroundColor(Color.black)
                .opacity(0.52)
            
                Text("\(betStatus)")
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .medium))
                    
            
        }.frame(width: 72, height: 33)
    }
}

struct BetStatus_Previews: PreviewProvider {
    static var previews: some View {
        BetStatus()
    }
}
