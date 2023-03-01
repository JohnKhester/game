//
//  LineNavBar.swift
//  BrazenGames
//
//  Created by Andrey on 27.02.2023.
//

import SwiftUI

struct LineNavBar: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(red: 13/255, green: 15/255, blue: 18/255))
                .frame(height: 2)
                .background(
                    Rectangle()
                        .fill(Color.white.opacity(0.01))
                        .offset(y: -1)
                        .blur(radius: 1)
                        .mask(Rectangle())
                        .frame(height: 1)
                )
           
        }
    }
}


struct LineNavBar_Previews: PreviewProvider {
    static var previews: some View {
        LineNavBar()
    }
}
