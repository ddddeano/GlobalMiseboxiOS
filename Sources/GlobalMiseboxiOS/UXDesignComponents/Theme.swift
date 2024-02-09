//
//  Theme.swift
//
//
//  Created by Daniel Watson on 09.02.2024.
//

import Foundation
import SwiftUI

public let MBColourDarkBlue = Color(red: 0.10, green: 0.20, blue: 0.45) // A deep, dark blue
public let MBColourPaleBlue = Color(red: 0.70, green: 0.85, blue: 0.95) // A light, airy blue
public let MBColourPaleGreen = Color(red: 0.76, green: 0.88, blue: 0.78) // A soft, pale green
public let MBColourDarkGreen = Color(red: 0.13, green: 0.55, blue: 0.13) // A rich, natural green
public let MBColourNaturalPurple = Color(red: 0.58, green: 0.44, blue: 0.86) // A gentle, natural purple inspired by seashells
public let MBColourCream = Color(red: 0.92, green: 0.91, blue: 0.88) // A soft, light cream color

public struct Palette {
    public let color1: Color
    public let color2: Color

   public init(color1: Color, color2: Color) {
        self.color1 = color1
        self.color2 = color2
    }
}

public let devPalette = Palette(color1: MBColourNaturalPurple, color2: MBColourPaleGreen)
