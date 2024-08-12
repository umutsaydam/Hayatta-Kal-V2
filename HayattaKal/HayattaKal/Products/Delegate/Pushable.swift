//
//  Pushable.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 12.08.2024.
//

import UIKit

protocol Pushable {
    func push(_ viewController: UIViewController)
}

extension Pushable where Self: UIViewController {
    func push(_ viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
