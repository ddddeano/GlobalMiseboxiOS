//
//  AvatarView.swift
//
//
//  Created by Daniel Watson on 09.02.2024.
//

import Foundation
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
            circleBackground()
            if env.shouldShow {
                showRing()
            }
            image()
            bubble()
                .frame(width: width * 0.20, height: height * 0.20)
                .offset(x: width * 0.33, y: width * 0.33)
        }
        .onTapGesture(perform: onTap)
    }
    
    private func circleBackground() -> some View {
        Circle()
            .fill(palette.highlightGradient) // Use the highlight gradient from the palette
            .frame(width: width, height: height)
            .overlay(
                Circle().stroke(Color.black, lineWidth: width * 0.01)
            )
    }

    
    private func showRing() -> some View {
        Circle()
            .stroke(lineWidth: 4)
            .foregroundColor(.white) // Customize this as needed
            .frame(width: width * 0.85, height: height * 0.85)
            .overlay(
                Circle().stroke(Color.black, lineWidth: width * 0.01)
            )
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
                    .frame(width: width * (env.shouldShow ? 0.9 : 1))
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color(.black), lineWidth: width * 0.02)
                    )
            case .failure:
                Image(systemName: "exclamationmark.triangle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.red)
                    .frame(width: width * 0.6, height: height * 0.6)
            @unknown default:
                EmptyView()
            }
        }
    }
    
    private func bubble() -> some View {
        Group {
            switch env {
            case .edit:
                Image(systemName: "pencil.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .background(Circle().fill(palette.primaryColor))
            case .content(let show) where show:
                // New Content Bubble Configuration
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [NewContentColors.color1, NewContentColors.color2]), startPoint: .topLeading, endPoint: .bottomTrailing))

            case .notification(let show) where show:
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [NotificationColors.color1, NotificationColors.color2]), startPoint: .topLeading, endPoint: .bottomTrailing))

            default:
                EmptyView()
            }
        }
    }


}
import SwiftUI

struct AvatarView_Previews: PreviewProvider {
    static let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3) // Adjust the count if you want a different layout

    static var previews: some View {
        ZStack {
            // Background using primary gradient from devPalette1
            Rectangle()
                .fill(devPalette1.backgroundGradient)
                .edgesIgnoringSafeArea(.all)
            
            // Display avatars in a grid
            LazyVGrid(columns: columns, spacing: 20) {
                // Edit Environment Avatar
                AvatarView(
                    imageUrl: defaultImage,
                    width: 100,
                    height: 100,
                    env: .edit,
                    onTap: { print("Edit Avatar tapped") },
                    palette: devPalette1
                )

                // Content Environment Avatar (show: true)
                AvatarView(
                    imageUrl: defaultImage,
                    width: 100,
                    height: 100,
                    env: .content(show: true),
                    onTap: { print("Content (show: true) Avatar tapped") },
                    palette: devPalette1
                )

                // Content Environment Avatar (show: false)
                AvatarView(
                    imageUrl: defaultImage,
                    width: 100,
                    height: 100,
                    env: .content(show: false),
                    onTap: { print("Content (show: false) Avatar tapped") },
                    palette: devPalette1
                )

                // Notification Environment Avatar (show: true)
                AvatarView(
                    imageUrl: defaultImage,
                    width: 100,
                    height: 100,
                    env: .notification(show: true),
                    onTap: { print("Notification (show: true) Avatar tapped") },
                    palette: devPalette1
                )

                // Notification Environment Avatar (show: false)
                AvatarView(
                    imageUrl: defaultImage,
                    width: 100,
                    height: 100,
                    env: .notification(show: false),
                    onTap: { print("Notification (show: false) Avatar tapped") },
                    palette: devPalette1
                )
            }
            .padding()
        }
        .previewLayout(.sizeThatFits)
    }
}
