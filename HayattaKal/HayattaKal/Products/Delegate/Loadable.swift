//
//  Loadable.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 12.08.2024.
//

import Foundation

protocol Loadable {
    func loadable(_ bool: Bool)
}

extension Loadable where Self: StatefulViewController {
    func loadable(_ bool: Bool) {
        DispatchQueue.main.async {
            if bool {
                self.startAnimating()
            } else {
                self.stopAnimating()
            }
        }
    }
}
