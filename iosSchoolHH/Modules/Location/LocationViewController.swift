//
//  LocationViewController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 13.11.2023.
//

import UIKit

class LocationViewController: UIViewController {
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

        view.backgroundColor = .purple
        getListOfLocation()
    }

    private func getListOfLocation() {
        dataProvider.location { location, error in
            guard let location else {
                print(error ?? "no error")
                return
            }
            print(location)
        }
    }
}
