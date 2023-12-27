//
//  CharacterViewController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.11.2023.
//
import UIKit
import SPIndicator

protocol CharacterViewControllerDelegate: AnyObject {
    func searchCharacter(name: String)
    func showAllCharacters()
}

final class CharacterViewController<View: CharacterView>: BaseViewController<View> {
    private let updateQueue = DispatchQueue(label: "CharacterRequestQueue")
    private let dataProvider: CharacterDataProvider
    private let imageService: ImageService
    private let charactersUrlList: [String]

    var selectCharacter: ((CharacterCellData) -> Void)?

    private var location: String?
    private var characters: [Character] = []
    private var charactersDictionary: [String: String] = [:]

    init(dataProvider: CharacterDataProvider, imageService: ImageService, data: LocationCellData) {
        self.dataProvider = dataProvider
        self.imageService = imageService
        charactersUrlList = data.residents
        location = data.name

        super.init(nibName: nil, bundle: nil)
        title = "Жители локации \"\(data.name)\""
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBar()
        rootView.setView()
        showAllCharacters()
    }

    // MARK: - Private methods

    private func loadCharacters(url: [String]) {
        url.enumerated().forEach { idx, url in
            requestCharacter(url: url) { [weak self] character in
                guard let self else {
                    return
                }

                DispatchQueue.main.async {
                    self.rootView.updateCharacter(idx: idx, with: CharacterCellData(
                        character: character,
                        isLoading: true,
                        image: nil,
                        selectClosure: self.selectClosure
                    ))
                }

                self.imageService.getImage(url: character.image, completion: { [weak self] image in
                    DispatchQueue.main.async {
                        self?.rootView.updateCharacter(idx: idx, with: CharacterCellData(
                            character: character,
                            isLoading: false,
                            image: image,
                            selectClosure: self?.selectClosure
                        ))
                        self?.charactersDictionary[character.name] = url
                    }
                })
            }
        }
    }

    private func selectClosure(data: CoreCellInputData) {
        guard let data = data as? CharacterCellData else {
            return
        }
        selectCharacter?(data)
    }

    private func requestCharacter(url: String, completion: @escaping (Character) -> Void) {
        if let character = characters.first(where: { $0.url == url }) {
            completion(character)
            return
        }
        DispatchQueue.global().async {
            self.dataProvider.character(url: url) { [weak self] character, error in
                guard let character else {
                    DispatchQueue.main.async {
                        SPIndicator.present(title: error?.rawValue ?? "Ошибочка", haptic: .error)
                    }
                    return
                }

                self?.updateQueue.async {
                    self?.characters.append(character)
                    completion(character)
                }
            }
        }
    }

    private func setupBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "character-back"),
            style: .plain,
            target: self,
            action: #selector(back)
        )
    }

    @objc private func back() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension CharacterViewController: CharacterViewControllerDelegate {
    func searchCharacter(name: String) {
        let charactersFilter: [String] = Array(charactersDictionary.filter {$0.key.lowercased().contains(
            name.lowercased())}.values
        )

        rootView.update(
            data: CharacterViewData(
                find: CharacterFindCellData(delegate: self),
                cells: charactersFilter.map {CharacterCellData(url: $0)}
            )
        )

        loadCharacters(url: charactersFilter)
    }

    func showAllCharacters() {
        rootView.update(
            data: CharacterViewData(
                find: CharacterFindCellData(delegate: self),
                cells: charactersUrlList.map {CharacterCellData(url: $0)}
            )
        )

        loadCharacters(url: charactersUrlList)
    }
}
