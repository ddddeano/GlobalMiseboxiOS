//
//  SwiftUIView.swift
//  
//
//  Created by Daniel Watson on 09.02.2024.
//

import Foundation
import SwiftUI

public struct AvatarView: View {
    var imageUrl: String
    var width: CGFloat
    var height: CGFloat
    var onSelect: () -> Void
    var hasNewContent: Bool
    var palette: Palette
    
    public init(imageUrl: String, width: CGFloat, height: CGFloat, onSelect: @escaping () -> Void, palette: Palette, hasNewContent: Bool) {
        self.imageUrl = imageUrl
        self.width = width
        self.height = height
        self.onSelect = onSelect
        self.hasNewContent = hasNewContent
        self.palette = palette
    }
    
    public var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            palette.color1,
                            palette.color2,
                            palette.color1 // Repeating the first color for a subtle flash effect
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: width, height: height) // 100% of input width and height
                .overlay(
                    Circle()
                        .stroke(Color(.black), lineWidth: width * 0.01) // 2% border of the darker color
                )
            
            if hasNewContent {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.yellow, Color.orange, Color.white, Color.orange,Color.yellow]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: width * 0.9, height: height * 0.9)
            }
            AsyncImage(url: URL(string: imageUrl)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: width * (hasNewContent ? 0.8 : 0.9), height: height * 0.9)
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
            if hasNewContent {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.red, Color.orange]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .overlay(
                        Circle()
                            .stroke(Color(.black), lineWidth: width * 0.01)
                    )
                    .frame(width: width * 0.20, height: height * 0.20)
                    .offset(x: width * 0.33, y: width * 0.33)
                    
                
            }
        }
        .onTapGesture(perform: onSelect)
    }
}
