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

extension AppRouter {
    func route() {
        window?.backgroundColor = UIColor.systemBackground
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
    }
}
