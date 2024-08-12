//
//  Dismissable.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 12.08.2024.
//

import UIKit

protocol Dismissable {
    func dismiss(_ animated: Bool)
}

extension Dismissable where Self: UIViewController {
    func dismiss(_ animated: Bool) {
        self.dismiss(animated: animated)
    }
}
