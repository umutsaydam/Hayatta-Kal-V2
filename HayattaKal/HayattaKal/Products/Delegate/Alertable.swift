//
//  Alertable.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 12.08.2024.
//

import UIKit

protocol Alertable {
    func alert(_ alert: AlertModel, prefferedStyle: UIAlertController.Style)
}

extension Alertable where Self: UIViewController {
    func alert(_ alert: AlertModel, prefferedStyle: UIAlertController.Style) {
        let controller = UIAlertController(title: alert.title,
                                           message: alert.message,
                                           preferredStyle: prefferedStyle)

        let primaryAction = UIAlertAction(title: alert.primaryButton, style: .cancel)
        controller.addAction(primaryAction)

        if let secondaryButton = alert.secondaryButton {
            let secondaryAction = UIAlertAction(title: alert.secondaryButton, style: .destructive)
            controller.addAction(secondaryAction)
        }

        self.present(controller, animated: true)
    }
}
