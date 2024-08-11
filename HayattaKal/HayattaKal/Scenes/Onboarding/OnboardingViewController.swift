//
//  OnboardingViewController: UIV.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 11.08.2024.
//

import SwiftUI
import UIKit

final class OnboardingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }
}

private extension OnboardingViewController {
    func setUp() {
        let onboardingScene = OnboardingScene()
        let onboardingHostingVC = UIHostingController(rootView: onboardingScene)

        addChild(onboardingHostingVC)
        view.addSubview(onboardingHostingVC.view)
        onboardingHostingVC.didMove(toParent: self)
        onboardingHostingVC.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            onboardingHostingVC.view.topAnchor.constraint(equalTo: view.topAnchor),
            onboardingHostingVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            onboardingHostingVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            onboardingHostingVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
