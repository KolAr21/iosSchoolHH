//
//  CharacterViewController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.11.2023.
//
import UIKit

final class CharacterViewController: UIViewController {
    private let dataProvider: CharacterDataProvider

    init(dataProvider: CharacterDataProvider) {
        self.dataProvider = dataProvider
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .brown
        character()
    }

    // MARK: - Private func

    private func character() {
        dataProvider.character { character, _ in
            guard let character else {
                return
            }
            print(
                character.id,
                character.name,
                character.species,
                character.image,
                character.url,
                character.episode,
                character.gender,
                character.status
            )
        }
    }
}
