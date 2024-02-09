//
//  AvatarView.swift
//
//
//  Created by Daniel Watson on 09.02.2024.
//

import Foundation
import SwiftUI

import SwiftUI

public enum Env {
    case edit(action: () -> Void)
    case content(show: Bool, action: () -> Void)
    case notification(show: Bool, action: () -> Void)
    
    // Provides an array of colors based on the environment
    var colors: [Color] {
        switch self {
        case .content(let show, _) where show:
            return [NewContentColors.color1, NewContentColors.color2, NewContentColors.color2, NewContentColors.color1]
        case .notification(let show, _) where show:
            return [NotificationColors.color1, NotificationColors.color2, NotificationColors.color2, NotificationColors.color1]
        case .edit:
            // Assuming no specific colors for edit or an empty array as a placeholder
            return []
        case .content(_, _),
             .notification(_, _):
            // For cases where either `show` is false or you don't care about the action
            // You might return an empty array or a default color set
            return []
        }
    }

    
    // Determines if the ring should be shown based on the environment
    var shouldShowRing: Bool {
        switch self {
        case .content(let show, _), .notification(let show, _):
            return show
        case .edit:
            return false
        }
    }
    
    // Executes the action associated with the current environment
    func onSelect() {
        switch self {
        case .edit(let action),
             .content(_, let action),
             .notification(_, let action):
            action()
        }
    }
}



public struct AvatarView: View {
    var imageUrl: String
    var width: CGFloat
    var height: CGFloat
    var env: Env
    var palette: Palette
    
    public init(imageUrl: String, width: CGFloat, height: CGFloat, env: Env, palette: Palette) {
        self.imageUrl = imageUrl
        self.width = width
        self.height = height
        self.env = env
        self.palette = palette
    }
    
    public var body: some View {
        ZStack {
            circleBackground
            if env.shouldShowRing {
                showRing
            }
            image
            bubble
                .frame(width: width * 0.20, height: height * 0.20)
                .offset(x: width * 0.33, y: width * 0.33)
        }
        .onTapGesture {
            env.onSelect()
        }
    }
    
    private var circleBackground: some View {
        Circle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [
                        palette.primaryColor,
                        palette.primaryColorCompliment,
                        palette.primaryColor
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(width: width, height: height)
            .overlay(
                Circle()
                    .stroke(Color.black, lineWidth: width * 0.01)
            )
    }
    
    private var showRing: some View {
        let colors = env.colors // Fetch colors based on the current environment
        return Circle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: colors),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(width: width * 0.9, height: height * 0.9)
    }
    
    
    
    private var image: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: width * (env.shouldShowRing ? 0.8 : 0.9), height: height * 0.9)
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
    
    
    private var bubble: some View {
        Group {
            switch env {
            case .edit:
                ZStack {
                    Circle()
                        .fill(palette.primaryColor)
                        .frame(width: width * 0.20, height: height * 0.20)
                    Image(systemName: "pencil.circle")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: width * 0.15, height: height * 0.15)
                }            case .content(show: let show, action: let action):
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: env.colors), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .overlay(
                        Circle().stroke(Color.black, lineWidth: width * 0.01) // Adding the black stroke here
                    )
            case .notification(show: let show, action: let action):
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: env.colors), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .overlay(
                        Circle().stroke(Color.black, lineWidth: width * 0.01) // Adding the black stroke here
                    )
            }
        }
    }
}

// Eximport SwiftUI

// Ensure this is defined somewhere accessible by the preview

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AvatarView(
                imageUrl: defaultImage,
                width: 100,
                height: 100,
                env: .edit(action: {
                    print("Edit tapped")
                }),
                palette: devPalette1
            )
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Edit Environment")

            AvatarView(
                imageUrl: defaultImage,
                width: 100,
                height: 100,
                env: .content(show: true, action: {
                    print("Content true tapped")
                }),
                palette: devPalette1
            )
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Content Environment True")

            AvatarView(
                imageUrl: defaultImage,
                width: 100,
                height: 100,
                env: .notification(show: true, action: {
                    print("Notification tapped")
                }),
                palette: devPalette1
            )
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Notification Environment True")
            
            AvatarView(
                imageUrl: defaultImage,
                width: 100,
                height: 100,
                env: .content(show: false, action: {
                    print("Content false tapped")
                }),
                palette: devPalette1
            )
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Content Environment False")
        }
    }
}
