//
//  LocationCell.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 27.11.2023.
//

import UIKit

final class LocationCell: UITableViewCell {
    var data: LocationCellData? {
        didSet {
            guard let data else {
                return
            }
            update(data: data)
        }
    }

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var populationLabel: UILabel!
    @IBOutlet private weak var arrowImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = .clear
    }

    // MARK: - Private methods

    private func update(data: LocationCellData) {
        nameLabel.text = data.name
        typeLabel.text = data.type
        populationLabel.text = data.population
    }
}
