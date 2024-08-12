//
//  Presentable.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 12.08.2024.
//

import UIKit

protocol Presentable {
    func present(_ viewControllerToPresent: UIViewController)
}

extension Presentable where Self: UIViewController {
    func present(_ viewControllerToPresent: UIViewController) {
        self.present(viewControllerToPresent, animated: true)
    }
}
