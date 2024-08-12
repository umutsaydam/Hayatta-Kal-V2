//
//  AlertModel.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 12.08.2024.
//

import Foundation

struct AlertModel {
    var title: String
    var message: String
    var primaryButton: String
    var secondaryButton: String?

    static var empty: AlertModel = .init(title: "",
                                         message: "",
                                         primaryButton: "",
                                         secondaryButton: "")
}
