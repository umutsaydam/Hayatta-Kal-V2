//
//  StatefulViewController.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 14.08.2024.
//

import UIKit

class StatefulViewController: UIViewController, UINavigationControllerDelegate {
    var container: UIView!

    func startAnimating() {
        container = UIView(frame: view.bounds)
        view.addSubview(container)
        container.backgroundColor = .systemBackground
        container.alpha = 0

        UIView.animate(withDuration: 0.25) {
            self.container.alpha = 0.75
        }

        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(activityIndicator)

        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])

        activityIndicator.startAnimating()
    }

    func stopAnimating() {
        DispatchQueue.main.async {
            self.container.removeFromSuperview()
            self.container = nil
        }
    }

    func showUnavailableState(_ model: UnavailableModel) {
        container?.removeFromSuperview()

        container = UIView(frame: view.bounds)
        view.addSubview(container)
        container.backgroundColor = .systemBackground

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false

        let imageView = UIImageView(image: UIImage(systemName: model.systemImage.rawValue))
        let configuration = UIImage.SymbolConfiguration(pointSize: 50, weight: .regular)
        imageView.image = UIImage(systemName: model.systemImage.fill, withConfiguration: configuration)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .halloweenOrange
        imageView.isUserInteractionEnabled = true

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapGestureRecognizer))
        imageView.addGestureRecognizer(tapGestureRecognizer)
        stackView.addArrangedSubview(imageView)

        let titleLabel = UILabel()
        titleLabel.text = model.title
        titleLabel.font = UIFont.monospacedSystemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .gray4
        titleLabel.textAlignment = .center
        stackView.addArrangedSubview(titleLabel)

        let descriptionLabel = UILabel()
        descriptionLabel.text = model.description
        descriptionLabel.font = UIFont.monospacedSystemFont(ofSize: 16, weight: .regular)
        descriptionLabel.textColor = .gray3
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        stackView.addArrangedSubview(descriptionLabel)
        
        container.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    func hideUnavailableState() {
        container?.removeFromSuperview()
        container = nil
    }

    @objc func imageTapGestureRecognizer() {
        imageTapGestureRecognizerAction()
    }

    func imageTapGestureRecognizerAction() {}
}
