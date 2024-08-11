//
//  View+Extension.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 11.08.2024.
//

import SwiftUI

extension View {
    @ViewBuilder
    func versionForegroundColor(_ color: Color) -> some View {
        if #available(iOS 17, *) {
            self
                .foregroundStyle(color)
        } else {
            self
                .foregroundColor(color)
        }
    }

    @ViewBuilder
    func versionCornerRadius(_ radius: CGFloat) -> some View {
        if #available(iOS 17, *) {
            self
                .clipShape(.rect(cornerRadius: radius))
        } else {
            self
                .cornerRadius(radius)
        }
    }
    
    func authTextFieldModifier(foregroundColor: Color, backgroundColor: Color, size: CGSize, radius: CGFloat) -> some View {
        modifier(AuthTextFieldModifier(foreground: foregroundColor,
                                       background: backgroundColor,
                                       size: size,
                                       radius: radius))
    }

    func authButtonModifier(foregroundColor: Color, colors: [Color], size: CGSize, radius: CGFloat) -> some View {
        modifier(AuthButtonModifier(foreground: foregroundColor,
                                    colors: colors,
                                    size: size,
                                    radius: radius))
    }

    func authButtonStyle(scale: CGFloat = 0.90, opacity: CGFloat = 0.95) -> some View {
        buttonStyle(AuthButtonStyle(scale: scale, opacity: opacity))
    }

    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil)
    }

    func commonShadow(color: Color = .shadow2) -> some View {
        self
            .shadow(color: color, radius: 12, y: 4)
    }
}
