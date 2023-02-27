//
//  UserPick.swift
//  BrazenGames
//
//  Created by Andrey on 27.02.2023.
//

import SwiftUI

struct UserPick: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 66, height: 66)
                .background(
                    Image("userPick")
                        .resizable()
                        .scaledToFill()
                )
        }
    }
}

struct UserPick_Previews: PreviewProvider {
    static var previews: some View {
        UserPick()
    }
}
