//
//  PersonViewController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.12.2023.
//

import UIKit
import PKHUD

final class PersonViewController<View: PersonView>: BaseViewController<View> {

    private var episodes: [Episode] = []

    private let dataProvider: PersonDataProvider
    private let episodeUrls: [String]
    private let updateQueue = DispatchQueue(label: "PersonRequestQueue")
    private let imageURL: String?
    private let imageService: ImageService

    init(dataProvider: PersonDataProvider, data: CharacterCellData, imageService: ImageService) {
        self.dataProvider = dataProvider
        episodeUrls = data.episodes
        imageURL = data.imageUrl
        self.imageService = imageService
        super.init(nibName: nil, bundle: nil)
        title = "Жители локации \"\(data.name ?? "")\""
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBar()
        rootView.setView()

        guard let imageURL else {
            return
        }
        imageService.getImage(url: imageURL) { [weak self] image in
            guard let image else {
                return
            }
            self?.episodeUrls.forEach { url in
                self?.requestEpisode(url: url) { episode in
                    DispatchQueue.main.async {
                        self?.episodes.append(episode)
                    }
                }
            }
            DispatchQueue.main.async {
                self?.rootView.update(
                    data: .init(
                        image: image,
                        episodes: self?.episodes.sorted(by: { $0.id < $1.id }) ?? []
                    )
                )
            }
        }
    }

    // MARK: - Private func

    private func requestEpisode(url: String, completion: @escaping (Episode) -> Void) {
        DispatchQueue.global().async {
            self.dataProvider.episode(url: url) { [weak self] episode, error in
                guard let episode else {
                    print(error ?? "no error")
                    return
                }
                self?.updateQueue.async {
                    self?.episodes.append(episode)
                    completion(episode)
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
