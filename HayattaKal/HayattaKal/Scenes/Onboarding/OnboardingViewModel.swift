//
//  OnboardingViewModel.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 11.08.2024.
//

import SwiftUI

final class OnboardingViewModel: NSObject, ObservableObject {
    @Published var currentStep: Int = .zero

    func clickGetStarted() {
        UserDefaultsManager.shared.set(true, forkey: .onboarding)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            appContainer.router.routeVC()
        }
    }
}
