//
//  OnboardingScene.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 11.08.2024.
//

import SwiftUI

struct OnboardingScene: View {
    @StateObject var viewModel: OnboardingViewModel = .init()

    var body: some View {
        bodyView
            .onAppear(perform: onAppear)
    }

    func onAppear() {}
}

#Preview {
    OnboardingScene()
}
