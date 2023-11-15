//
//  CharacterAssembly.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.11.2023.
//

import Foundation

protocol CharacterAssembly {
    func characterVC() -> CharacterViewController
    func characterDataProvider() -> CharacterDataProvider
    func characterCoordinator() -> CharacterCoordinator
}

extension Assembly: CharacterAssembly {
    func characterVC() -> CharacterViewController {
        .init(dataProvider: characterDataProvider())
    }

    func characterDataProvider() -> CharacterDataProvider {
        CharacterDataProviderImp(apiClient: apiClient)
    }

    func characterCoordinator() -> CharacterCoordinator {
        CharacterCoordinator(assembly: self, context: .init())
    }
}
