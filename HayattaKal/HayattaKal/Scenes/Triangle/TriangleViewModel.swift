//
//  TriangleViewModel.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 14.08.2024.
//

import UIKit

final class TriangleViewModel {
    var delegate: TriangleViewModelDelegate?
}

// MARK: - Publics

extension TriangleViewModel: TriangleViewModelProtocol {
    func viewDidLoad() {
        delegate?.showUnavailable(.imagePicker)
    }

    func viewWillAppear() {}

    func viewDidAppear() {}

    func handleImagePickerOutput(_ output: TriangleViewControllerImagePickerOutput) {
        switch output {
        case .didSelectImage(let uIImage):
            delegate?.dismiss(true)
        //    delegate?.hideUnavailable()
        case .didSelectCancel:
            delegate?.dismiss(true)
        }
    }
}

// MARK: - Privates

private extension TriangleViewModel {
    func createPDF(from pages: [PDFModel], completion: @escaping (URL?) -> Void) {
        /*
         let images = [UIImage(named: "Onboarding1")!, UIImage(named: "Onboarding2")!, UIImage(named: "Onboarding3")!]
         let descriptions = ["Bu birinci resmin açıklaması", "Bu ikinci resmin açıklaması", "Bu üçüncü resmin açıklaması"]
         let pages = zip(images, descriptions).map { PDFModel(image: $0.0, description: $0.1) }

         createPDF(from: pages) { pdfURL in
             if let pdfURL = pdfURL {
                 let navVC = UINavigationController(rootViewController: PDFViewerViewController(pdfURL: pdfURL))
                 self.present(navVC, animated: true)
             }
         }
         */

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

                pageContent.image.draw(in: pageRect)

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
