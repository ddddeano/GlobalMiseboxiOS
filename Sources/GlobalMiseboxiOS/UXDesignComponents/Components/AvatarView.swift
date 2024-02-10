import SwiftUI
public enum Env {
    case edit
    case content(show: Bool)
    case notification(show: Bool)
    
    var shouldShow: Bool {
        switch self {
        case .content(let show), .notification(let show):
            return show
        case .edit:
            return false
        }
    }
}

public struct AvatarView: View {
    var imageUrl: String
    var width: CGFloat
    var height: CGFloat
    var env: Env
    var onTap: () -> Void
    var palette: Palette
    
    public init(imageUrl: String, width: CGFloat, height: CGFloat, env: Env, onTap: @escaping () -> Void, palette: Palette) {
        self.imageUrl = imageUrl
        self.width = width
        self.height = height
        self.env = env
        self.onTap = onTap
        self.palette = palette
    }
    
    public var body: some View {
        ZStack {
            image()
            if env.shouldShow {
                bubble()
                    .frame(width: width * 0.20, height: height * 0.20)
                    .offset(x: width * 0.33, y: height * 0.33)
            }
        }
        .onTapGesture(perform: onTap)
        .frame(width: width, height: height)
    }
    
    private func image() -> some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(palette.borderColor, lineWidth: width * 0.02)
                    )
            case .failure:
                Image(systemName: "exclamationmark.triangle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.red)
                    .frame(width: width * 0.5, height: height * 0.5)
            @unknown default:
                EmptyView()
            }
        }
    }
    
    private func bubble() -> some View {
        switch env {
        case .edit:
            return AnyView(
                Image(systemName: "pencil.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .background(Circle().fill(palette.primaryColor))
                    .frame(width: width * 0.20, height: height * 0.20)
            )
        case .content(let show) where show:
            return AnyView(
                Circle()
                    .fill(Color.newContent)
                    .frame(width: width * 0.20, height: height * 0.20)
            )
        case .notification(let show) where show:
            return AnyView(
                Circle()
                    .fill(Color.newNotification)
                    .frame(width: width * 0.20, height: height * 0.20)
            )
        default:
            return AnyView(EmptyView())
        }
    }
}
import SwiftUI

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            Text("Preview")
                .foregroundColor(.white)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(userPalette.primaryColor))
            
            AvatarView(
                imageUrl: defaultImage,
                width: 100,
                height: 100,
                env: .edit,
                onTap: { print("Edit Avatar tapped") },
                palette: userPalette
            )
            AvatarView(
                imageUrl: defaultImage,
                width: 100,
                height: 100,
                env: .content(show: true),
                onTap: { print("Content (show: true) Avatar tapped") },
                palette: userPalette
            )
            AvatarView(
                imageUrl: defaultImage,
                width: 100,
                height: 100,
                env: .content(show: false),
                onTap: { print("Content (show: false) Avatar tapped") },
                palette: userPalette
            )
            AvatarView(
                imageUrl: defaultImage,
                width: 100,
                height: 100,
                env: .notification(show: true),
                onTap: { print("Notification (show: true) Avatar tapped") },
                palette: userPalette
            )
            AvatarView(
                imageUrl: defaultImage,
                width: 100,
                height: 100,
                env: .notification(show: false),
                onTap: { print("Notification (show: false) Avatar tapped") },
                palette: userPalette
            )
        }
        .padding()
        .previewLayout(.sizeThatFits)
        .background(userPalette.background.edgesIgnoringSafeArea(.all))
    }
}
