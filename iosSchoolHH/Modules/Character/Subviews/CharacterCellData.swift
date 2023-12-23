//
//  CharacterCellData.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 07.12.2023.
//

import UIKit

struct CharacterCellData: CoreCellInputData {
    let url: String
    let name: String?
    let gender: String?
    let imageUrl: String?
    let episodes: [String]
    let isLoading: Bool
    let image: UIImage?

    var selectClosure: ((CoreCellInputData) -> Void)?

    init(character: Character, isLoading: Bool, image: UIImage?, selectClosure: ((CoreCellInputData) -> Void)?) {
        url = character.url
        name = character.name
        gender = "\(character.species) \(character.gender)"
        imageUrl = character.image
        episodes = character.episode
        self.isLoading = isLoading
        self.image = image
        self.selectClosure = selectClosure
    }

    init(url: String) {
        self.url = url
        name = nil
        gender = nil
        imageUrl = nil
        episodes = []
        isLoading = true
        image = nil
    }
}
