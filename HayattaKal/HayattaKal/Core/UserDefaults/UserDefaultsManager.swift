//
//  UserDefaultsManager.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 11.08.2024.
//

import Foundation

final class UserDefaultsManager {
    static let shared: UserDefaultsManager = .init()

    private init() {}
}

extension UserDefaultsManager: UserDefaultsManagerProtocol {
    func get<T: Codable>(forkey key: UserDefaultsKey, as type: T.Type) -> T? {
        guard let data = UserDefaults.standard.data(forKey: key.rawValue) else { return nil }

        do {
            let value = try JSONDecoder().decode(type.self, from: data)

            return value
        } catch {
            return nil
        }
    }

    func set<T: Codable>(_ value: T, forkey key: UserDefaultsKey) {
        let data = try? JSONEncoder().encode(value)
        UserDefaults.standard.set(data, forKey: key.rawValue)
    }

    func remove(forkey key: UserDefaultsKey) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
}
