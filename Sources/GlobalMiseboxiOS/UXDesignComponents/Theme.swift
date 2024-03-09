import SwiftUI

// MARK: - Extension to add color mixing capabilities

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

import SwiftUI

extension Color {
    
    // Misebox Global Colors
    public static let goldenNugget = Color(hex: "FFCC80")

    // Misebox User Colors
    public static let persianIndigo = Color(hex: "391463")
    public static let lavender = Color(hex: "AA76E5")
    
    // Misebox Agent Colors
    public static let britishRacingGreen = Color(hex: "143E22")
    public static let teaGreen = Color(hex: "D6E4A6")
    
    // Misebox Chef Colors
    public static let chiliRed = Color(hex: "C21807")
    public static let apricot = Color(hex: "FEB89F")
    
    // Misebox Recruiter Colors
    public static let navyBlue = Color(hex: "000080")
    public static let skyBlue = Color(hex: "87CEEB")
}


public class Palette {
    public static let shared = Palette()
    
    public var primary: Color = Color("Primary")
    public var secondary: Color = Color("Secondary")
    
    public var newContent: Color = .blue
    public var newNotification: Color = .blue
    
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

