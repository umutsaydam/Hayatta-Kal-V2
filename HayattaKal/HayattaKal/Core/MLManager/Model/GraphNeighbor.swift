//
//  GraphNeighbor.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 15.08.2024.
//

import Foundation

struct GraphNeighborNode {
    let first: GraphNode
    let second: GraphNode
    var cost: Double

    var totalSafetyScore: Double {
        first.safetyScore + second.safetyScore
    }
}
