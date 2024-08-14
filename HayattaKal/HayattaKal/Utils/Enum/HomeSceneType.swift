//
//  HomeSceneType.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 11.08.2024.
//

import Foundation

enum HomeSceneType: String, CaseIterable {
    case beforeTheEarthquake
    case duringAnEarthquake
    case afterTheEarthquake
    case earthquakeBag

    var title: String {
        currentModel.title
    }

    var headline: String {
        currentModel.headline
    }

    var currentModel: HomeDetailModel {
        switch self {
        case .beforeTheEarthquake:
            HomeDetailModel.homeDetailItems[0]
        case .duringAnEarthquake:
            HomeDetailModel.homeDetailItems[1]
        case .afterTheEarthquake:
            HomeDetailModel.homeDetailItems[2]
        case .earthquakeBag:
            HomeDetailModel.homeDetailItems[3]
        }
    }

    var url: String { "" }

    var image: String {
        SFSymbol.file_menu_and_selection.rawValue
    }
}
