//
//  ColorSettings.swift
//  BrazenGames
//
//  Created by Andrey on 26.02.2023.
//

import Foundation
import SwiftUI

extension UIColor {
    convenience init(hex: UInt32) {
        let red = CGFloat((hex & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xff00) >> 8) / 255.0
        let blue = CGFloat(hex & 0xff) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
 



