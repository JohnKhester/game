//
//  ChipsComponents.swift
//  BrazenGames
//
//  Created by Andrey on 03.03.2023.
//

import SwiftUI

struct ChipsComponents: View {
    @ObservedObject var chipViewModel = ChipViewModel()
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(chipViewModel.chips) { chip in
                    ChipView(chip: chip)
                        .overlay(
                            chip.isSelected ? RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2) : nil
                        )
                        .onTapGesture {
                            chipViewModel.selectChip(chip)
                     }
                }
            }
        }
    }
}

struct ChipsComponents_Previews: PreviewProvider {
    static var previews: some View {
        ChipsComponents()
    }
}
