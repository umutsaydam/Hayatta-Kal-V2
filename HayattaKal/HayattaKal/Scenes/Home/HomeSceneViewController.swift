//
//  ViewController.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 10.08.2024.
//

import SwiftUI
import UIKit

final class HomeSceneViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }
}

private extension HomeSceneViewController {
    func setUp() {
        let homeScene = HomeScene()
        let homeHostingVC = UIHostingController(rootView: homeScene)

        addChild(homeHostingVC)
        view.addSubview(homeHostingVC.view)
        homeHostingVC.didMove(toParent: self)
        homeHostingVC.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            homeHostingVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeHostingVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeHostingVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeHostingVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

#Preview {
    HomeSceneViewController()
}
