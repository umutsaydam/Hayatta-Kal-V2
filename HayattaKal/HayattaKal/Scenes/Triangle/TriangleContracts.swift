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
    func viewDidDisappear()
    func handleImagePickerOutput(_ output: TriangleViewControllerImagePickerOutput)
}

/// ViewController output
enum TriangleViewControllerImagePickerOutput {
    case didSelectImage(UIImage)
    case didSelectCancel
}

/// View
protocol TriangleViewModelDelegate: AnyObject, Alertable, Dismissable, Loadable, Presentable, Unavailable {
    func handleViewModelOutput(_ output: TriangleViewModelOutput)
}

// ViewModel output
enum TriangleViewModelOutput {
    case setIsLoading(Bool)
    case selectImage(Bool)
}
