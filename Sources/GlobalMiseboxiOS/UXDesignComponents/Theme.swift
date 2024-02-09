//
//  Theme.swift
//
//
//  Created by Daniel Watson on 09.02.2024.
//

import Foundation
import SwiftUI




public let BlueberryBlue = Color(red: 0.05, green: 0.20, blue: 0.35) // HEX: #0D3359
public let SkyBerryBlue = Color(red: 0.60, green: 0.80, blue: 0.90) // HEX: #99CCFF
public let MatchaGreen = Color(red: 0.68, green: 0.85, blue: 0.70) // HEX: #ADD8B3
public let KaleGreen = Color(red: 0.10, green: 0.45, blue: 0.10) // HEX: #1A7331
public let LavenderHoney = Color(red: 0.50, green: 0.40, blue: 0.80) // HEX: #8066CC
public let VanillaCream = Color(red: 0.95, green: 0.95, blue: 0.90) // HEX: #F2F2E6
public let TomatoRed = Color(red: 0.99, green: 0.37, blue: 0.33) // HEX: #FC5E54
public let WatermelonPink = Color(red: 0.99, green: 0.56, blue: 0.67) // HEX: #FC8FAC
public let LemonZest = Color(red: 1.00, green: 0.98, blue: 0.80) // HEX: #FFFACD
public let BlueCuracao = Color(red: 0.45, green: 0.76, blue: 0.98) // HEX: #73C2FB
public let RaspberryMousse = Color(red: 1.00, green: 0.94, blue: 0.96) // HEX: #FFF0F5
public let MintLeaf = Color(red: 0.00, green: 0.65, blue: 0.58) // HEX: #00A896
public let StrawberryFrost = Color(red: 0.98, green: 0.22, blue: 0.36) // HEX: #FA385B
public let AvocadoGreen = Color(red: 0.24, green: 0.82, blue: 0.44) // HEX: #3DD070
public let MangoTango = Color(red: 0.95, green: 0.73, blue: 0.31) // HEX: #F2BA50
public let GrapeSoda = Color(red: 0.33, green: 0.35, blue: 0.65) // HEX: #545AA1
public let PersimmonOrange = Color(red: 1.00, green: 0.44, blue: 0.37) // HEX: #FF7060
public let ArcticBlueberry = Color(red: 0.43, green: 0.61, blue: 0.76) // HEX: #6E9CC2

public struct Palette {
    public var color1: Color
    public var color2: Color
    public var color3: Color
    public var color4: Color
    public var color5: Color
    public var color6: Color
    public var color7: Color
    public var color8: Color

    public init(color1: Color, color2: Color, color3: Color, color4: Color, color5: Color, color6: Color, color7: Color, color8: Color) {
        self.color1 = color1
        self.color2 = color2
        self.color3 = color3
        self.color4 = color4
        self.color5 = color5
        self.color6 = color6
        self.color7 = color7
        self.color8 = color8
    }
}

public let devPalette1 = Palette(
    color1: BlueberryBlue,
    color2: SkyBerryBlue,
    color3: MatchaGreen,
    color4: KaleGreen,
    color5: LavenderHoney,
    color6: VanillaCream,
    color7: TomatoRed,
    color8: WatermelonPink
)

public let devPalette2 = Palette(
    color1: LemonZest,
    color2: BlueCuracao,
    color3: RaspberryMousse,
    color4: MintLeaf,
    color5: StrawberryFrost,
    color6: AvocadoGreen,
    color7: MangoTango,
    color8: GrapeSoda
)

public let devPalette3 = Palette(
    color1: PersimmonOrange,
    color2: ArcticBlueberry,
    color3: BlueberryBlue,
    color4: SkyBerryBlue,
    color5: MatchaGreen,
    color6: KaleGreen,
    color7: LavenderHoney,
    color8: VanillaCream
)
