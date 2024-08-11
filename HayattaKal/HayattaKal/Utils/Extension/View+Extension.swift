//
//  View+Extension.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 11.08.2024.
//

import SwiftUI

extension View {
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
