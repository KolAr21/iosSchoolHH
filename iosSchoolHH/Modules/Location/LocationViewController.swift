//
//  LocationViewController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 13.11.2023.
//

import UIKit
import SPIndicator

final class LocationViewController<View: LocationView>: BaseViewController<View> {
    private let dataProvider: LocationDataProvider

    var selectLocation: ((LocationCellData) -> Void)?

    init(dataProvider: LocationDataProvider) {
        self.dataProvider = dataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBar()
        rootView.setView()
        rootView.selectLocation = selectLocation
        getListOfLocation()
    }

    // MARK: - Private methods

    private func getListOfLocation() {
        dataProvider.location { [weak self] location, error in
            guard let location else {
                DispatchQueue.main.async {
                    SPIndicator.present(title: error?.rawValue ?? "Ошибочка", haptic: .error)
                }
                return
            }
            self?.rootView.update(data: LocationViewData(list: location))
        }
    }

    private func setupBar() {
        title = "Выбор планеты"
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor(named: "black") ?? .black,
            .font: UIFont.systemFont(ofSize: 18)
        ]
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "location-refresh"),
            style: .plain,
            target: self,
            action: #selector(reload)
        )
    }

    @objc private func reload() {
        getListOfLocation()
    }
}
