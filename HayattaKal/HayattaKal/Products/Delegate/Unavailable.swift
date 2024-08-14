//
//  Unavailable.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 15.08.2024.
//

import Foundation

protocol Unavailable {
    func showUnavailable(_ model: UnavailableModel)
    func hideUnavailable()
}

extension Loadable where Self: StatefulViewController {
    func showUnavailable(_ model: UnavailableModel) {
        showUnavailableState(model)
    }

    func hideUnavailable() {
        hideUnavailableState()
    }
}
