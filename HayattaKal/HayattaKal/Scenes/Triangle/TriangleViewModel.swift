//
//  TriangleViewModel.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 14.08.2024.
//

import UIKit

final class TriangleViewModel {
    var selectedImage: UIImage?

    var delegate: TriangleViewModelDelegate?
    var mlManager: MLManager?

    init() {
        setUpMLManager()
    }
}

// MARK: - TriangleViewModel + TriangleViewModelProtocol

extension TriangleViewModel: TriangleViewModelProtocol {
    func viewDidLoad() {
        delegate?.showUnavailable(.imagePicker)
    }

    func viewDidDisappear() {
        delegate?.loadable(false)
        delegate?.showUnavailable(.imagePicker)
    }

    func handleImagePickerOutput(_ output: TriangleViewControllerImagePickerOutput) {
        switch output {
        case .didSelectImage(let uiImage):
            delegate?.dismiss(true)
            delegate?.loadable(true)

            mlManager?.findSafetyArea(uiImage)
        case .didSelectCancel:
            break
        }
    }
}

// MARK: - TriangleViewModel + MLManagerProtocolDelegate

extension TriangleViewModel: MLManagerProtocolDelegate {
    func handleMLManagerOutput(_ output: [PDFModel]) {
        mlManager = nil
        delegate?.loadable(false)

        createPDF(from: output) { [weak self] pdfURL in
            if let pdfURL = pdfURL {
                let navVC = UINavigationController(rootViewController: PDFViewerViewController(pdfURL: pdfURL))
                self?.delegate?.present(navVC, completion: { [weak self] bool in
                    if bool {
                        self?.setUpMLManager()
                    }
                })
            }
        }
    }
}

// MARK: - Privates

private extension TriangleViewModel {
    func setUpMLManager() {
        mlManager = MLManager()
        mlManager?.delegate = self
    }

    func createPDF(from pages: [PDFModel], completion: @escaping (URL?) -> Void) {
        let format = UIGraphicsPDFRendererFormat()
        let metaData = [
            kCGPDFContextTitle: "PDF Document",
            kCGPDFContextAuthor: "Your Name"
        ]
        format.documentInfo = metaData as [String: Any]

        let pageSize = CGSize(width: 595, height: 842)
        let pageRect = CGRect(origin: .zero, size: pageSize)
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)

        let data = renderer.pdfData { context in
            for (index, pageContent) in pages.enumerated() {
                context.beginPage()

                if let image = pageContent.image {
                    image.draw(in: pageRect)
                }

                let descriptionAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 12),
                    .foregroundColor: UIColor.black
                ]
                let descriptionRect = CGRect(x: 20, y: pageSize.height - 80, width: pageSize.width - 40, height: 50)
                pageContent.description.draw(in: descriptionRect, withAttributes: descriptionAttributes)

                let pageNumberText = "Page \(index + 1) of \(pages.count)"
                let pageNumberAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 12),
                    .foregroundColor: UIColor.black
                ]
                let pageNumberRect = CGRect(x: 20, y: 20, width: pageSize.width - 40, height: 50)
                pageNumberText.draw(in: pageNumberRect, withAttributes: pageNumberAttributes)
            }
        }

        let fileManager = FileManager.default
        let tempDirectory = fileManager.temporaryDirectory
        let pdfURL = tempDirectory.appendingPathComponent("\(UUID().uuidString).pdf")

        do {
            try data.write(to: pdfURL)
            completion(pdfURL)
        } catch {
            completion(nil)
        }
    }
}
