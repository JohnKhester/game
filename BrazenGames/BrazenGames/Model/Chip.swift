//
//  Chip.swift
//  BrazenGames
//
//  Created by Andrey on 12.02.2023.
//

import Foundation
import SwiftUI
import AVFoundation

struct Chip: Identifiable, Equatable {
    let id = UUID()
    let denomination: Int
    let image: Image
    var isSelected: Bool = false
    
}

class ChipViewModel: ObservableObject {
    @Published var chips: [Chip] = []
    @Published var selectedChip: Chip?
    @Published var betAmount: Int = 0
    @Published var balance: Int = 10000 // default balance
    var audioPlayer: AVAudioPlayer?

    init() {
        if let soundURL = Bundle.main.url(forResource: "chips", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.prepareToPlay()
            } catch {
                print("Error loading sound file: \(error)")
            }
        } else {
            print("Sound file not found")
        }
        let chipsData = [
            (10, Image("chip pink")),
            (25, Image("chip blue")),
            (50, Image("chip green")),
            (100, Image("chip red")),
            (500, Image("chip yellow"))
        ]

        chips = chipsData.map { Chip(denomination: $0, image: $1) }
    }
    
  
    func selectChip(_ chip: Chip) {
        if chip == selectedChip {
            selectedChip = nil
            betAmount -= chip.denomination
        } else {
            selectedChip = chip
            betAmount += chip.denomination
            balance -= chip.denomination // decrease the balance by the chip's denomination
        }
            
        chips = chips.map { $0.id == chip.id ? Chip(denomination: $0.denomination, image: $0.image, isSelected: true) : Chip(denomination: $0.denomination, image: $0.image, isSelected: false) }
        audioPlayer?.play()
    }
    
 
    
    func clearBet() {
         if let chip = selectedChip {
             balance += chip.denomination // increase the balance by the selected chip's denomination
         }
         selectedChip = nil
         betAmount = 0
     }
 
}
