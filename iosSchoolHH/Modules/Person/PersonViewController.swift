//
//  PersonViewController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.12.2023.
//

import UIKit
import PKHUD

final class PersonViewController<View: PersonView>: BaseViewController<View> {
    private let updateQueue = DispatchQueue(label: "PersonRequestQueue")
    private let dataProvider: PersonDataProvider
    private let imageService: ImageService
    private let episodeUrls: [String]
    private let imageURL: String?

    private var episodes: [Episode] = []

    init(dataProvider: PersonDataProvider, imageService: ImageService, data: CharacterCellData) {
        self.dataProvider = dataProvider
        self.imageService = imageService
        episodeUrls = data.episodes
        imageURL = data.imageUrl

        super.init(nibName: nil, bundle: nil)
        title = data.name
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBar()
        rootView.setView()

        if let image = imageURL {
            imageService.getImage(url: image) { [weak self] image in
                guard let image else {
                    return
                }

                DispatchQueue.main.async {
                    self?.rootView.update(
                        data: .init(
                            image: image, episodesUrls: self?.episodeUrls ?? []
                        )
                    )
                }
            }
        }
        episodeUrls.enumerated().forEach { idx, url in
            requestEpisode(url: url) { episode in
                DispatchQueue.main.async {
                    self.rootView.updateEpisode(idx: idx, with: PersonEpisodeCellData(episode: episode))
                }
            }
        }
    }

    // MARK: - Private methods

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
