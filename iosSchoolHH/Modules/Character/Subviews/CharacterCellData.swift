//
//  CharacterCellData.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 07.12.2023.
//

import UIKit

struct CharacterCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?

    let url: String
    let isLoading: Bool
    let name: String?
    let imageUrl: String?
    let image: UIImage?

    init(character: Character, isLoading: Bool, image: UIImage?, selectClosure: ((CoreCellInputData) -> Void)?) {
        url = character.url
        self.isLoading = isLoading
        name = character.name
        imageUrl = character.image
        self.image = image
    }

    init(url: String) {
        self.url = url
        isLoading = true
        name = nil
        imageUrl = nil
        image = nil
    }
}
