//
//  Dice.swift
//  BrazenGames
//
//  Created by Andrey on 05.03.2023.
//

import SwiftUI
import AVFoundation

class Dice: ObservableObject {
    @Published var dieOne: Int = 0
    @Published var dieTwo: Int = 0
    @Published var value = 1
    @Published var isCardSelected: Bool = false
    @Published var selectedRank: String? = nil
    @Published var selectCard: Bool = false
    @Published var showRandomCard = false
    @Published var buttonsHighLow = false
    
    @Published var isShowingRandomCard = false
    
 
    
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
    
    private var numCardsDrawn = 0
    
    let cardSuits = ["♠️", "♣️", "♥️", "♦️"]
    var cardRanks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "Jk"]

    func rollDice() {
        dieOne = Int.random(in: 1...6)
        dieTwo = Int.random(in: 1...6)
        value = dieOne + dieTwo
        audioPlayer?.play()
    }
    
    func getCardRanks() -> [String]? {
        if self.selectCard {
            return [selectedRank!]
        } else {
            switch (dieOne + dieTwo) {
            case 2:
                return ["2", "J"]
            case 3:
                return ["3", "Q"]
            case 4:
                return ["4", "K"]
            case 10:
                return ["10"]
            case 11:
                return ["Jk", "A"]
            case 12:
                return ["Jk"]
            default:
                if let rank = cardRanks.first(where: { $0.prefix(1) == String(dieOne + dieTwo) }) {
                    return [rank]
                } else {
                    return nil
                }
            }
        }
    }

}

 
