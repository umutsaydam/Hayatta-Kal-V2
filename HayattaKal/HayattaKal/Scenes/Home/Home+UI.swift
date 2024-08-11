//
//  Home+UI.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 11.08.2024.
//

import SwiftUI

extension HomeScene {
    var bodyView: some View {
        ZStack {
            self.navigationView

            VStack {
                header

                cardsView
            }
        }
        .sheet(item: $selectedHomeDetailModel) { detailModel in
            HomeDetailScene(homeDetailModel: detailModel)
        }
    }

    var navigationView: some View {
        GeometryReader { geometry in
            Color.orange1.ignoresSafeArea()
                .padding(.bottom, 32)
                .frame(height: geometry.size.height / 4)
        }
    }

    var header: some View {
        Text("Hayatta Kal")
            .monospaced()
            .fontWeight(.bold)
            .font(.largeTitle)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }

    var cardsView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    self.columnView(items: HomeSceneType.allCases.splitByOdd().even)
                    self.columnView(items: HomeSceneType.allCases.splitByOdd().odd)
                }
            }
        }
        .padding(.horizontal, 2)
    }

    func columnView(items: [HomeSceneType]) -> some View {
        VStack {
            ForEach(items, id: \.rawValue) { item in
                Button {
                    selectedHomeDetailModel = item.currentModel
                } label: {
                    self.homeCardView(home: item)
                }
            }

            Spacer()
        }
    }

    func homeCardView(home: HomeSceneType) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Image(.home)

                Text(home.title)
                    .monospaced()
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray4)
                    .padding(.vertical, 8)

                Text(home.headline)
                    .monospaced()
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray3)
                    .lineLimit(7)
            }

            Spacer()
        }
        .frame(maxHeight: 300, alignment: .top)
        .multilineTextAlignment(.leading)
        .padding(12)
        .background(
            Color.white
                .cornerRadius(12)
                .commonShadow(color: .shadow1)
        )
        .padding(8)
    }
}
