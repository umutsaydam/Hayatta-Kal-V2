//
//  UserDefaultsContracts.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 11.08.2024.
//

import Foundation

protocol UserDefaultsManagerProtocol {
    func get<T: Codable>(forkey key: UserDefaultsKey, as type: T.Type) -> T?
    func set<T: Codable>(_ value: T, forkey key: UserDefaultsKey)
    func remove(forkey key: UserDefaultsKey)
}
