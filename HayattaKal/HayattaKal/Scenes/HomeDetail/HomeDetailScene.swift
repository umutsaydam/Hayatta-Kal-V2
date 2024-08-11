//
//  HomeDetailScene.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 11.08.2024.
//

import SwiftUI

struct HomeDetailScene: View {
    var homeDetailModel: HomeDetailModel

    var body: some View {
        bodyView
    }
}

#Preview {
    HomeDetailScene(homeDetailModel: HomeDetailModel.homeDetailItems[0])
}
