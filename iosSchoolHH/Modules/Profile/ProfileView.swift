//
//  ProfileView.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 09.12.2023.
//

import UIKit

protocol ProfileView: UIView {
    func setView()
    func update(data: ProfileViewData)
}

final class ProfileViewImp: UIView, ProfileView {
    private lazy var collectionView: UICollectionView = {
        UICollectionView(
            frame: .zero,
            collectionViewLayout: layout()
        )
    }()

    private var sections: [CoreSection] = []

    func setView() {
        collectionView.backgroundColor = UIColor(named: "silver")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)

        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    func update(data: ProfileViewData) {
        sections = [
            Sections.photoSection.create(data: data),
            Sections.usernameSection.create(data: data),
            Sections.dateColorSection.create(data: data),
            Sections.logoutSection.create(data: data)
        ]
        sections.forEach { $0.registrate(collectionView: collectionView) }
        collectionView.reloadData()
    }

    private enum Sections: Int {
        case photoSection
        case usernameSection
        case dateColorSection
        case logoutSection

        func create(data: ProfileViewData) -> CoreSection {
            switch self {
            case .photoSection:
                return ProfilePhotoSection(cellsData: [data.photoCellData])
            case .usernameSection:
                return ProfileUsernameSection(cellsData: [data.usernameCellData])
            case .dateColorSection:
                return ProfileDateColorSection(cellsData: data.dateColorCellData)
            case .logoutSection:
                return ProfileLogoutSection(cellsData: [data.logoutCellData])
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

extension ProfileViewImp: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.sections[section].numberOfItem
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        sections[indexPath.section].cell(collectionView: collectionView, indexPath: indexPath) ?? UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegate

extension ProfileViewImp: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sections[indexPath.section].selectCell(at: indexPath.row)
    }
}

private extension ProfileViewImp {
    typealias ProfilePhotoSection = Section<ProfilePhotoCell, EmptyReusableView, EmptyReusableView>
    typealias ProfileUsernameSection = Section<ProfileUsernameCell, EmptyReusableView, EmptyReusableView>
    typealias ProfileDateColorSection = Section<ProfileDateColorCell, EmptyReusableView, EmptyReusableView>
    typealias ProfileLogoutSection = Section<ProfileLogoutCell, EmptyReusableView, EmptyReusableView>
}
