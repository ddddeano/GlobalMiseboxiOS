import SwiftUI

// MARK: - Food-based Color Definitions
public extension Color {
    static let BlueberryBlue = Color(red: 0.05, green: 0.20, blue: 0.35)
    static let SkyBerryBlue = Color(red: 0.60, green: 0.80, blue: 0.90)
    static let KaleGreen = Color(red: 0.10, green: 0.45, blue: 0.10)
    static let LavenderHoney = Color(red: 0.50, green: 0.40, blue: 0.80)
    static let VanillaCream = Color(red: 0.95, green: 0.95, blue: 0.90)
    static let TomatoRed = Color(red: 0.99, green: 0.37, blue: 0.33)
    static let WatermelonPink = Color(red: 0.99, green: 0.56, blue: 0.67)
    static let BlueCuracao = Color(red: 0.45, green: 0.76, blue: 0.98)
    static let RaspberryMousse = Color(red: 1.00, green: 0.94, blue: 0.96)
    static let MintLeaf = Color(red: 0.00, green: 0.65, blue: 0.58)
    static let StrawberryFrost = Color(red: 0.98, green: 0.22, blue: 0.36)
    static let MangoTango = Color(red: 0.95, green: 0.73, blue: 0.31)
    static let GrapeSoda = Color(red: 0.33, green: 0.35, blue: 0.65)
    static let ArcticBlueberry = Color(red: 0.43, green: 0.61, blue: 0.76)
    static let LemonZest = Color(red: 1.00, green: 0.98, blue: 0.80)
    static let SaffronSpice = Color(red: 0.96, green: 0.77, blue: 0.19)
    static let PaprikaRed = Color(red: 0.91, green: 0.34, blue: 0.24)
    static let AvocadoGreen = Color(red: 0.24, green: 0.82, blue: 0.44)
    static let MatchaGreen = Color(red: 0.68, green: 0.85, blue: 0.70)
    static let CoconutMilk = Color(red: 0.97, green: 0.97, blue: 0.97)
    static let PersimmonOrange = Color(red: 1.00, green: 0.44, blue: 0.37)

    // System Colors
    static var newContent: Color {
        return .PersimmonOrange
    }
    
    static var newNotification: Color {
        return .SaffronSpice
    }
}

extension Color {
    func mixedWithBlack(fraction: CGFloat) -> Color {
        guard let rgbColor = UIColor(self).cgColor.components, rgbColor.count >= 3 else {
            return self // Return the original color if conversion fails
        }

        // Calculate the new color components
        let red = rgbColor[0] * (1 - fraction)
        let green = rgbColor[1] * (1 - fraction)
        let blue = rgbColor[2] * (1 - fraction)

        return Color(red: Double(red), green: Double(green), blue: Double(blue))
    }
}

public struct Palette {
    public var primaryColor: Color

    public init(primaryColor: Color) {
        self.primaryColor = primaryColor
    }

    public var background: Color {
        return primaryColor
    }

    public var borderColor: Color {
        return primaryColor.mixedWithBlack(fraction: 0.8) 
    }
}




// Example usage
public let userPalette = Palette(primaryColor: .BlueCuracao)
