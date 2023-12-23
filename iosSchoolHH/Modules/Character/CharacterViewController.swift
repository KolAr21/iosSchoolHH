//
//  CharacterViewController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.11.2023.
//
import UIKit
import SPIndicator

final class CharacterViewController<View: CharacterView>: BaseViewController<View> {
    private let updateQueue = DispatchQueue(label: "CharacterRequestQueue")
    private let dataProvider: CharacterDataProvider
    private let imageService: ImageService
    private let charactersUrlList: [String]

    var selectCharacter: ((CharacterCellData) -> Void)?

    private var characters: [Character] = []

    init(dataProvider: CharacterDataProvider, imageService: ImageService, data: LocationCellData) {
        self.dataProvider = dataProvider
        self.imageService = imageService
        charactersUrlList = data.residents

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
        rootView.update(data: CharacterViewData(cells: charactersUrlList.map({ CharacterCellData(url: $0) })))

        let selectClosure: ((CoreCellInputData) -> Void)? = { [weak self] data in
            guard let data = data as? CharacterCellData else {
                return
            }
            self?.selectCharacter?(data)
        }

        charactersUrlList.enumerated().forEach { idx, url in
            requestCharacter(url: url) { [weak self] character in
                guard let self else {
                    return
                }

                DispatchQueue.main.async {
                    self.rootView.updateCharacter(idx: idx, with: CharacterCellData(
                        character: character,
                        isLoading: true,
                        image: nil,
                        selectClosure: selectClosure
                    ))
                }

                self.imageService.getImage(url: character.image, completion: { [weak self] image in
                    DispatchQueue.main.async {
                        self?.rootView.updateCharacter(idx: idx, with: CharacterCellData(
                            character: character,
                            isLoading: false,
                            image: image,
                            selectClosure: selectClosure
                        ))
                    }
                })
            }
        }
    }

    // MARK: - Private methods

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
