//
//  HomeDetail+UI.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 11.08.2024.
//

import SwiftUI

extension HomeDetailScene {
    var bodyView: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            detailCard
                .ignoresSafeArea()
        }
    }

    var navigationTitle: some View {
        Text(homeDetailModel.title)
            .monospaced()
            .fontWeight(.heavy)
            .font(.title)
            .versionForegroundColor(.halloweenOrange)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    var detailCard: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                navigationTitle

                Text(homeDetailModel.headline)
                    .monospaced()
                    .fontWeight(.heavy)
                    .font(.body)
                    .versionForegroundColor(.gray4)
                    .multilineTextAlignment(.leading)

                modelDescriptionsView
            }
        }
        .clipped()
        .padding(.horizontal, 16)
        .padding(.vertical, 32)
    }

    var modelDescriptionsView: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(homeDetailModel.description, id: \.self) { desc in
                Text(desc)
                    .monospaced()
                    .fontWeight(.regular)
                    .font(.callout)
                    .versionForegroundColor(.darkLiver)
                    .multilineTextAlignment(.leading)
            }
        }
    }
}
