//
//  SFSymbol.swift
//  HayattaKal
//
//  Created by Yunus Emre Berdibek on 11.08.2024.
//

import Foundation

enum SFSymbol: String {
    case person
    case envelope
    case gear
    case lock
    case camera
    case house
    case arrow_left = "arrow.left"
    case eye
    case eye_slash = "eye.slash"
    case info_circle = "info.circle"
    case network_slash = "network.slash"
    case arrow_clockwise = "arrow.clockwise"
    case book
    case magnifyingglass
    case globe
    case magazine
    case file_menu_and_selection = "filemenu.and.selection"
    case photo_badge_plus = "photo.badge.plus"
    case trash
    case photo

    var fill: String {
        switch self {
        case .person:
            "person.fill"
        case .envelope:
            "envelope.fill"
        case .lock:
            "lock.fill"
        case .house:
            "house.fill"
        case .eye:
            "eye.fill"
        case .eye_slash:
            "eye.slash.fill"
        case .info_circle:
            "info.circle.fill"
        case .book:
            "book.fill"
        case .magazine:
            "magazine.fill"
        case .trash:
            "trash.fill"
        case .photo_badge_plus:
            "photo.badge.plus.fill"
        case .photo:
            "photo.fill"
        default:
            rawValue
        }
    }
}
