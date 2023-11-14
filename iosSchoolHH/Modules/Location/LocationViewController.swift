//
//  LocationViewController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 13.11.2023.
//

import UIKit

class LocationViewController: UIViewController {
    private let dataProvider: LocationDataProvider
    private var onLocationSuccess: (() -> Void)?

    init(dataProvider: LocationDataProvider, onLocationSuccess: (() -> Void)?) {
        self.dataProvider = dataProvider
        self.onLocationSuccess = onLocationSuccess
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
        print("##################LOCATION##################")
        dataProvider.location { location, error in
            guard let location else {
                print(error ?? "no error")
                return
            }
            print(location)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { [weak self] timer in
            self?.onLocationSuccess?()
            timer.invalidate()
        }
    }
}
