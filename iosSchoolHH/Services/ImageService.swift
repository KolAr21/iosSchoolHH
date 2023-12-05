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
        if imageDict[url] != nil {
            completion(imageDict[url])
        } else {
            if imageDict.count >= 50 {
                imageDict.removeAll()
            }
            DispatchQueue.global().async {
                self.apiClient.requestImageData(url: url) { [weak self] data in
                    guard let self, let data, let dataImage = UIImage(data: data) else {
                        completion(nil)
                        return
                    }
                    self.updateQueue.async {
                        self.imageDict[url] = dataImage
                        completion(dataImage)
                    }
                }
            }
        }
    }
}
