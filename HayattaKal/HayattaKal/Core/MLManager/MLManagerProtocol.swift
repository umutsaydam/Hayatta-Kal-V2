//
//  MLManagerProtocol.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 15.08.2024.
//

import UIKit

protocol MLManagerProtocol {
    var delegate: MLManagerProtocolDelegate? { get set }
    func findSafetyArea(_ uiImage: UIImage)
}

protocol MLManagerProtocolDelegate: AnyObject {
    func handleMLManagerOutput(_ output: [PDFModel])
}
