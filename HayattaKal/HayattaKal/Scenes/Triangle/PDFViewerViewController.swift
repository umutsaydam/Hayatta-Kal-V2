//
//  PDFViewerViewController.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 12.08.2024.
//
import PDFKit
import UIKit

final class PDFViewerViewController: UIViewController {
    private let pdfURL: URL
    private let pdfView = PDFView()
    
    init(pdfURL: URL) {
        self.pdfURL = pdfURL
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        loadPDF()
    }
}

// MARK: - Privates

private extension PDFViewerViewController {
    func configureView() {
        view.backgroundColor = .white
        setupPDFView()
        setupNavigationBar()
    }
    
    func setupPDFView() {
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        pdfView.autoScales = true
        view.addSubview(pdfView)
        
        NSLayoutConstraint.activate([
            pdfView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pdfView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pdfView.topAnchor.constraint(equalTo: view.topAnchor),
            pdfView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupNavigationBar() {
        title = "PDF Viewer"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Download",
            style: .plain,
            target: self,
            action: #selector(downloadPDF)
        )
    }
    
    func loadPDF() {
        if let document = PDFDocument(url: pdfURL) {
            pdfView.document = document
        } else {
            print("Failed to load PDF document.")
        }
    }
    
    @objc func downloadPDF() {
        let activityViewController = UIActivityViewController(activityItems: [pdfURL], applicationActivities: nil)
        activityViewController.excludedActivityTypes = [.addToReadingList]
        
        present(activityViewController, animated: true, completion: nil)
    }
}
