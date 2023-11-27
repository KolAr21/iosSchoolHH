//
//  LocationViewController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 13.11.2023.
//

import UIKit

class LocationViewController<View: LocationView>: BaseViewController<View> {

    var selectLocation: ((LocationCellData) -> Void)?
    private let dataProvider: LocationDataProvider

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

    // MARK: - Private func

    private func getListOfLocation() {
        dataProvider.location { [weak self] location, error in
            guard let location else {
                print(error ?? "no error")
                return
            }
            print(location)
            self?.rootView.update(data: LocationViewData(list: location))
        }
    }

    private func setupBar() {
        title = "Выбор планеты"
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor(named: "DarkBlue") ?? .black,
            .font: UIFont.systemFont(ofSize: 18)
        ]
        /* navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: #selector(reload)
        )*/
    }
}
