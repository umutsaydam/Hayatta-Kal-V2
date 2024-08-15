//
//  TriangleViewController.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 11.08.2024.
//

import PDFKit
import UIKit

final class TriangleViewController: StatefulViewController {
    var viewModel: TriangleViewModelProtocol = TriangleViewModel()

    lazy var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
        imagePicker.delegate = self
        viewModel.viewDidLoad()
    }

    override func viewDidDisappear(_ animated: Bool) {
        viewModel.viewDidDisappear()
    }

    override func imageTapGestureRecognizer() {
        selectPhoto()
    }
}

// MARK: - TriangleViewController + TriangleViewModelDelegate

extension TriangleViewController: TriangleViewModelDelegate {
    func handleViewModelOutput(_ output: TriangleViewModelOutput) {}
}

// MARK: - TriangleViewController + UIImagePickerControllerDelegate

extension TriangleViewController: UIImagePickerControllerDelegate {
    func selectPhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            viewModel.handleImagePickerOutput(.didSelectImage(selectedImage))
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        viewModel.handleImagePickerOutput(.didSelectCancel)
    }
}
