//
//  HighLow.swift
//  BrazenGames
//
//  Created by Andrey on 12.02.2023.
//

import SwiftUI
import AVFoundation

class Dice: ObservableObject {
    @Published var value = 1
    var audioPlayer: AVAudioPlayer?
    let imageDice = [UIImage(named: "Dice One")!,
                     UIImage(named: "Dice Two")!,
                     UIImage(named: "Dice Three")!,
                     UIImage(named: "Dice Four")!,
                     UIImage(named: "Dice Five")!,
                     UIImage(named: "Dice Six")!]
    
    init() {
        if let soundURL = Bundle.main.url(forResource: "diceRollSound", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.prepareToPlay()
            } catch {
                print("Error loading sound file: \(error)")
            }
        } else {
            print("Sound file not found")
        }
    }
    
    func roll() {
        value = Int.random(in: 1...6)
        audioPlayer?.play()
    }
}

struct HighLow: View {
    @StateObject var dice1 = Dice()
    @StateObject var dice2 = Dice()
    @ObservedObject var chipViewModel = ChipViewModel()
    @State private var showDice = false
    
    var deck = createDeck()
    var body: some View {
        VStack {
            Text("Bet: \(chipViewModel.betAmount)")
                        Button(action: {
                            chipViewModel.clearBet()
                            showDice = false
                        }, label: {
                            Text("Clear Bet")
                        })
                            .padding(.top, 20)
            if showDice {
                HStack {
                    Image(uiImage: dice1.imageDice[dice1.value - 1])
                    Image(uiImage: dice2.imageDice[dice2.value - 1])
                }
            }
            
            Button(action: {
                dice1.roll()
                dice2.roll()
                showDice = true
            }, label: {
                Text("Roll Dice")
            }).disabled(chipViewModel.betAmount == 0)
            
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
        .padding()
    }
}
 
struct HighLow_Previews: PreviewProvider {
    static var previews: some View {
        HighLow()
    }
}

