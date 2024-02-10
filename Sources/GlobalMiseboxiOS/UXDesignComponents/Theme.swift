import SwiftUI
extension Color {
    // Method to  a color
    func lighter(by percentage: CGFloat = 30.0) -> Color {
        let uiColor = UIColor(self)
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let adjustment = 1.0 + percentage / 100.0
        return Color(UIColor(red: min(red * adjustment, 1.0),
                             green: min(green * adjustment, 1.0),
                             blue: min(blue * adjustment, 1.0),
                             alpha: alpha))
    }
}

// MARK: - Color Definitions
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
}

// MARK: - Universal Colours
public extension Color {
    static let PersimmonOrange = Color(red: 1.00, green: 0.44, blue: 0.37)
}
// MARK: - Specific Use Case Colors
public struct NotificationColors {
    static let color1 = Color.AvocadoGreen
    static let color2 = Color.MatchaGreen
}

public struct NewContentColors {
    static let color1 = Color.SaffronSpice
    static let color2 = Color.PaprikaRed
}
import SwiftUI

public struct Palette {
    public var primaryColor: Color
    public var primaryColorLight: Color { primaryColor.lighter() }
    
    // Additional color properties
    public var color3: Color
    public var color4: Color
    public var color5: Color
    public var color6: Color
    public var color7: Color
    public var color8: Color

    // Updated initializer to include all colors
    public init(primaryColor: Color, color3: Color, color4: Color, color5: Color, color6: Color, color7: Color, color8: Color) {
        self.primaryColor = primaryColor
        self.color3 = color3
        self.color4 = color4
        self.color5 = color5
        self.color6 = color6
        self.color7 = color7
        self.color8 = color8
    }
    
    public var backgroundGradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [primaryColor, primaryColorLight]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    public var highlightGradient: LinearGradient {
          LinearGradient(
              gradient: Gradient(colors: [primaryColor, .PersimmonOrange, primaryColor, primaryColor]), // Three times primary color, then orange
              startPoint: .topLeading,
              endPoint: .bottomTrailing
          )
      }

}

// Updated palette instances
public let userPalette1 = Palette(
    primaryColor: .KaleGreen,
    color3: .MatchaGreen,
    color4: .KaleGreen,
    color5: .LavenderHoney,
    color6: .VanillaCream,
    color7: .TomatoRed,
    color8: .WatermelonPink
)

public let devPalette1 = Palette(
    primaryColor: .KaleGreen,
    color3: .MatchaGreen,
    color4: .KaleGreen,
    color5: .LavenderHoney,
    color6: .VanillaCream,
    color7: .TomatoRed,
    color8: .WatermelonPink
)

public let devPalette2 = Palette(
    primaryColor: .LemonZest,
    color3: .RaspberryMousse,
    color4: .MintLeaf,
    color5: .StrawberryFrost,
    color6: .AvocadoGreen,
    color7: .MangoTango,
    color8: .GrapeSoda
)

public let devPalette3 = Palette(
    primaryColor: .PersimmonOrange,
    color3: .BlueberryBlue,
    color4: .SkyBerryBlue,
    color5: .MatchaGreen,
    color6: .KaleGreen,
    color7: .LavenderHoney,
    color8: .VanillaCream
)
