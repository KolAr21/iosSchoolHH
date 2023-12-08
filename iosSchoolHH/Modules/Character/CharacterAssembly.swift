//
//  CharacterAssembly.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.11.2023.
//

import Foundation

protocol CharacterAssembly {
    func characterVC(data: LocationCellData) -> CharacterViewController<CharacterViewImp>
    func characterDataProvider() -> CharacterDataProvider
    func characterCoordinator(data: LocationCellData) -> CharacterCoordinator
}

extension Assembly: CharacterAssembly {
    func characterVC(data: LocationCellData) -> CharacterViewController<CharacterViewImp> {
        .init(dataProvider: characterDataProvider(), data: data, imageService: imageService)
    }

    func characterDataProvider() -> CharacterDataProvider {
        CharacterDataProviderImp(apiClient: apiClient)
    }

    func characterCoordinator(data: LocationCellData) -> CharacterCoordinator {
        CharacterCoordinator(assembly: self, context: .init(data: data))
    }
}
