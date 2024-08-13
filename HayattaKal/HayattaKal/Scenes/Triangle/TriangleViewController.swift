//
//  TriangleViewController.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 11.08.2024.
//

import PDFKit
import UIKit

final class TriangleViewController: LoadableViewController {
    var viewModel: TriangleViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.viewDidLoad()
    }
}

// MARK: - Publics

extension TriangleViewController: TriangleViewModelDelegate {
    func handleViewModelOutput(_ output: TriangleViewModelOutput) {}
}
