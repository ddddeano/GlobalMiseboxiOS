//
//  AvatarView.swift
//
//
//  Created by Daniel Watson on 09.02.2024.
//

import Foundation
import SwiftUI

import SwiftUI

import SwiftUI

// Define the environment for the avatar view
public enum Env {
    case edit
    case content(show: Bool)
    case notification(show: Bool)
}

// AvatarView definition
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
            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [palette.primaryColor, palette.primaryColorCompliment, palette.primaryColor]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: width, height: height)
                .overlay(Circle().stroke(Color.black, lineWidth: width * 0.01))
            
            AsyncImage(url: URL(string: imageUrl)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: height)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.black, lineWidth: width * 0.02))
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
        .onTapGesture(perform: onTap)
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
