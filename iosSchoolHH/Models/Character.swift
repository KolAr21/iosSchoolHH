//
//  Character.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 23.10.2023.
//

import Foundation

final class Character: Codable {
    enum Gender: String, CaseIterable, Codable {
        case female = "Female"
        case male = "Male"
        case genderless = "Genderless"
        case unknown
    }

    enum Status: String, CaseIterable, Codable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown
    }

    let id: Int
    let name: String
    let species: String
    let image: String
    let url: String
    let episode: [String]
    let gender: Gender
    let status: Status
}
