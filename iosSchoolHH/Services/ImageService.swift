//
//  ImageService.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 30.11.2023.
//

import UIKit

protocol ImageService {
    func getImage(url: String, completion: @escaping (UIImage?) -> Void)
}

final class ImageServiceImp: ImageService {

    private var imageDict: [String: UIImage] = [:]

    private let apiClient: ApiClient
    private let updateQueue = DispatchQueue(label: "ImageServiceQueue")

    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    func getImage(url: String, completion: @escaping (UIImage?) -> Void) {

    }
}
