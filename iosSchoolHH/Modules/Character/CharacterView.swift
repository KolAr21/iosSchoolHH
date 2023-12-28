//
//  CharacterView.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 07.12.2023.
//

import UIKit

protocol CharacterView: UIView {
    func setView()
    func update(data: CharacterViewData)
    func updateCharacter(idx: Int, with data: CharacterCellData)
}

final class CharacterViewImp: UIView, CharacterView {
    private lazy var collectionView: UICollectionView = {
        UICollectionView(
            frame: .zero,
            collectionViewLayout: layout()
        )
    }()

    private var sections: [CoreSection] = []

    func setView() {
        self.backgroundColor = UIColor(named: "silver")

        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)

        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    func update(data: CharacterViewData) {
        sections = [
            Sections.findSection.create(data: data),
            Sections.characterSection.create(data: data)
        ]
        sections.forEach { $0.registrate(collectionView: collectionView) }
        collectionView.reloadData()
    }

    func updateCharacter(idx: Int, with data: CharacterCellData) {
        guard let index = sections.firstIndex(where: { $0 is CharactersSection }) else {
            return
        }

        sections[index].updateCell(at: IndexPath(item: idx, section: index), with: data)
        guard let cell = sections[index].cell(
            collectionView: collectionView,
            indexPath: IndexPath(item: idx, section: index)
        ) as? CharacterCell else {
            return
        }
        cell.update(with: data)
    }

    private enum Sections: Int {
        case findSection
        case characterSection

        func create(data: CharacterViewData) -> CoreSection {
            switch self {
            case .findSection:
                return CharactersFindSection(cellsData: [data.find])
            case .characterSection:
                return CharactersSection(cellsData: data.cells)
            }
        }
    }

    // MARK: - Private methods

    private func layout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { [unowned self] section, env -> NSCollectionLayoutSection? in
            guard let layoutSection = sections[section].sectionLayoutProvider?(section, env) else {
                return nil
            }
            return layoutSection
        }
    }
}

// MARK: - UICollectionViewDataSource

extension CharacterViewImp: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItem
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        sections[indexPath.section].cell(collectionView: collectionView, indexPath: indexPath) ?? UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegate

extension CharacterViewImp: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sections[indexPath.section].selectCell(at: indexPath.row)
    }
}

private extension CharacterViewImp {
    typealias CharactersFindSection = Section<CharacterFindViewCell, EmptyReusableView, EmptyReusableView>
    typealias CharactersSection = Section<CharacterCell, EmptyReusableView, EmptyReusableView>
}
