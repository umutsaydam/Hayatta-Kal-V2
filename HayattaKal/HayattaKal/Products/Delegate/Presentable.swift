//
//  Presentable.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 12.08.2024.
//

import UIKit

protocol Presentable {
    func present(_ viewControllerToPresent: UIViewController, completion: @escaping (Bool) -> Void)
}

extension Presentable where Self: UIViewController {
    func present(_ viewControllerToPresent: UIViewController, completion: @escaping (Bool) -> Void) {
        self.present(viewControllerToPresent, animated: true) {
            completion(true)
        }
    }
}
