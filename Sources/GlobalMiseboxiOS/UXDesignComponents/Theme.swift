import SwiftUI

// MARK: - Extension to add custom color definitions
extension View {
    public var 🎨: Palette {
        Palette.shared
    }
}

public struct ColorSet {
    let light: String
    let dark: String
    
    public init(light: String, dark: String) {
        self.light = light
        self.dark = dark
    }
}

public extension Color {
    
    static let Berry = ColorSet(light: "#FF6B6B", dark: "#2E1A33") // primary berry colour
    static let Mode = ColorSet(light: "#F7F0F7", dark: "#2D262E") // light and dark with a subtle hint of berry



}

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
}

// MARK: - Extension to add color mixing capabilities

extension Color {

    func mixed(with color: Color, fraction: CGFloat) -> Color {
        guard let baseRGB = UIColor(self).cgColor.components, baseRGB.count >= 3 else {
            return self
        }
        
        guard let mixRGB = UIColor(color).cgColor.components, mixRGB.count >= 3 else {
            return self
        }
        
        let mix = { (baseComponent: CGFloat, mixComponent: CGFloat) -> CGFloat in
            (1 - fraction) * baseComponent + fraction * mixComponent
        }
        
        return Color(red: Double(mix(baseRGB[0], mixRGB[0])),
                     green: Double(mix(baseRGB[1], mixRGB[1])),
                     blue: Double(mix(baseRGB[2], mixRGB[2])))
    }
}

public struct GradientBackgroundView: View {
    @State private var movingGradient = false
    var colors: [Color]
    
    public init(colors: [Color]) {
          self.colors = colors
      }
    
    public var body: some View {
        LinearGradient(
            gradient: Gradient(colors: colors),
            startPoint: movingGradient ? .topLeading : .bottomLeading,
            endPoint: movingGradient ? .bottomTrailing : .topTrailing
        )
        .edgesIgnoringSafeArea(.all)
        .animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true), value: movingGradient)
        .onAppear {
            movingGradient.toggle()
        }
    }
}

// MARK: - Pallet Singleton for dynamic theme adaptation

extension Color {
    public static let persianIndigo = Color(hex: "391463")
    public static let lavender = Color(hex: "AA76E5")
}

public class Palette {
    public static let shared = Palette()
    
    public var primary: Color = Color("Primary")
    public var secondary: Color = Color("Secondary")
    
    public var newContent: Color = .AvocadoGreen
    public var newNotification: Color = .PaprikaRed
    
    private init() {}
}
    /*
    public var background: Color {
        switch mode {
        case .light:
            return primaryColor.mixed(with: .black, fraction: 0.2)
        case .dark:
            return primaryColor.mixed(with: .white, fraction: 0.2)
        }
    }
    
    public var border: Color {
        switch mode {
        case .light:
            return primaryColor.mixed(with: .black, fraction: 0.8)
        case .dark:
            return primaryColor.mixed(with: .white, fraction: 0.8)
        }
    }
}
*/

