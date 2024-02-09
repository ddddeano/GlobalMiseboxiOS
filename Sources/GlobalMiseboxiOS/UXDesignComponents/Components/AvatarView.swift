//
//  AvatarView.swift
//
//
//  Created by Daniel Watson on 09.02.2024.
//

import Foundation
import SwiftUI

// Define your environment enum, including conditions for showing content and handling taps
public enum Env {
    case edit
    case content(show: Bool)
    case notification(show: Bool)
    
    // Determines if the ring should be shown based on the environment
    var shouldShow: Bool {
        switch self {
        case .content(let show), .notification(let show):
            return show
        case .edit:
            return false
        }
    }
}

// AvatarView definition
public struct AvatarView: View {
    var imageUrl: String
    var width: CGFloat
    var height: CGFloat
    var env: Env
    var onTap: () -> Void  // Closure for handling tap
    var palette: Palette  // Color palette for the view

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
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [palette.color6, palette.color8, palette.color6]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
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
                    .frame(width: width * (env.shouldShow ? 0.8 : 0.9), height: height * 0.9)
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

// Preview provider for AvatarView
struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(
            imageUrl: "https://example.com/image.jpg",
            width: 100,
            height: 100,
            env: .edit,
            onTap: { print("Avatar tapped") },
            palette: devPalette1
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
