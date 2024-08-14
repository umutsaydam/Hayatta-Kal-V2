//
//  UnavailableModel.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 15.08.2024.
//

import Foundation

struct UnavailableModel {
    let title: String
    let systemImage: SFSymbol
    let description: String

    static let network: UnavailableModel = .init(title: "İnternet Bağlantısı Yok",
                                                 systemImage: .network_slash,
                                                 description: "İçerik şu anda görüntülenemiyor. Lütfen internet bağlantınızı kontrol edin ve tekrar deneyin.")

    static let imagePicker: UnavailableModel = .init(title: "Resim Seçilmedi",
                                                     systemImage: .photo,
                                                     description: "Resim seçimi iptal edildi veya herhangi bir resim seçilmedi. Lütfen icon'a tıklayarak yeniden deneyin.")
}
