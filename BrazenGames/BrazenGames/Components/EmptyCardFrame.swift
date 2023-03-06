//
//  EmptyCardFrame.swift
//  BrazenGames
//
//  Created by Andrey on 06.03.2023.
//

import SwiftUI

struct EmptyCardFrame: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.18))
        }
        .frame(width: 96, height: 138)
    }
}

struct EmptyCardFrame_Previews: PreviewProvider {
    static var previews: some View {
        EmptyCardFrame()
            .previewLayout(.sizeThatFits)
    }
}
