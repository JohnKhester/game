//
//  HighLow.swift
//  BrazenGames
//
//  Created by Andrey on 12.02.2023.
//

import SwiftUI
import AVFoundation



class Dice: ObservableObject {
    @Published var dieOne: Int = 0
    @Published var dieTwo: Int = 0
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

    func rollDice() {
        dieOne = Int.random(in: 1...6)
        dieTwo = Int.random(in: 1...6)
        value = dieOne + dieTwo
        audioPlayer?.play()
    }
}

struct HighLow: View {
    @ObservedObject var chipViewModel = ChipViewModel()
    @ObservedObject var gameModel = Dice()
    @State private var showDice = false
    
    var deck = createDeck()
    var body: some View {
        VStack {
            Text("Balance: \(chipViewModel.balance)")
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
                    Image(uiImage: gameModel.imageDice[gameModel.dieOne - 1])
                    Image(uiImage: gameModel.imageDice[gameModel.dieTwo - 1])
                }
            }
            
            Button(action: {
                gameModel.rollDice() // Call rollDice method on gameModel object
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

