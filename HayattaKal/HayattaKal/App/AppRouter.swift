//
//  AppRouter.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 11.08.2024.
//

import UIKit

final class AppRouter {
    var window: UIWindow?

    init() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
    }
}

// MARK: - Publics

extension AppRouter {
    func start() {
        window?.backgroundColor = UIColor.systemBackground
        routeVC()
        window?.makeKeyAndVisible()
    }

    func routeVC() {
        guard let onboarding = UserDefaultsManager.shared.get(forkey: .onboarding, as: Bool.self),
              onboarding == true
        else {
            window?.rootViewController = OnboardingViewController()
            return
        }

        window?.rootViewController = TabBarController()
    }
}
