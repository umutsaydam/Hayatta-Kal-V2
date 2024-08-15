//
//  GraphNode.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 15.08.2024.
//

import Foundation

struct GraphNode: Identifiable {
    let id: String
    let type: GraphNodeType
    var alpha: CGFloat
    let safetyScore: CGFloat
    let rect: CGRect

    init(type: GraphNodeType, alpha: CGFloat, safetyScore: CGFloat, rect: CGRect) {
        self.id = UUID().uuidString
        self.type = type
        self.alpha = alpha
        self.safetyScore = safetyScore
        self.rect = rect
    }
}

struct GraphDetectedNode {
    let type: GraphNodeType
    let safetyScore: CGFloat
    let rect: CGRect
}

struct GraphSafetyNode {
    let first: GraphNode
    var second: GraphNode?
    var totalSafetyScore: Double
}
