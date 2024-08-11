//
//  Array+Extension.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 11.08.2024.
//

import Foundation

extension Array {
    func splitByOdd() -> (odd: Self, even: Self) {
        var odd = [Element]()
        var even = [Element]()

        for (index, element) in self.enumerated() {
            if index % 2 == 0 {
                even.append(element)
            } else {
                odd.append(element)
            }
        }

        return (odd: odd, even: even)
    }
}
