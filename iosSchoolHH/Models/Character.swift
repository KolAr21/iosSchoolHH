//
//  Character.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 23.10.2023.
//

import Foundation

class Character {
    enum Gender: String, CaseIterable {
        case female = "Female"
        case male = "Male"
        case genderless = "Genderless"
        case unknown
    }

    enum Status: String, CaseIterable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown
    }

    var id: Int
    var name: String
    var species: String
    var image: String
    var url: String
    var episode: [String]
    var gender: Gender
    var status: Status

    init(id: Int, name: String, species: String, image: String, url: String,
         episode: [String], gender: Gender, status: Status) {
        self.id = id
        self.name = name
        self.species = species
        self.image = image
        self.url = url
        self.episode = episode
        self.gender = gender
        self.status = status
    }
}
