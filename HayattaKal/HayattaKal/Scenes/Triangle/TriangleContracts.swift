//
//  TriangleContracts.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 14.08.2024.
//

import UIKit

/// ViewModel
protocol TriangleViewModelProtocol {
    var delegate: TriangleViewModelDelegate? { get set }

    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func didSelectImage(_ image: UIImage)
}

/// View
protocol TriangleViewModelDelegate: AnyObject, Alertable, Dismissable, Loadable, Presentable {
    func handleViewModelOutput(_ output: TriangleViewModelOutput)
}

// ViewModel output
enum TriangleViewModelOutput {
    case setIsLoading(Bool)
}
