//
//  ChipView.swift
//  BrazenGames
//
//  Created by Andrey on 12.02.2023.
//

import SwiftUI

struct ChipView: View {
    let chip: Chip
    var body: some View {
        ZStack {
            chip.image
                .resizable()
                .frame(width: 64, height: 64)
            Text("\(chip.denomination)")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.white)
                
        }
    }
}

struct ChipView_Previews: PreviewProvider {
    static var previews: some View {
        ChipView(chip: Chip(denomination: 50, image: Image("chip green")))
            .previewLayout(.sizeThatFits)
    }
}
