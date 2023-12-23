//
//  ApiError.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 13.11.2023.
//

import Foundation

enum ApiError: Error {
    case dataParsing
    case serverError
    case common(Data?)

    var rawValue: String {
        switch self {
        case .dataParsing:
            return "Ошибка парсинга"
        case .serverError:
            return "Ошибка получения данных"
        case let .common(data):
            guard let data else {
                return "Произошла неизвестная ошибка"
            }
            let error = try? JSONDecoder().decode(CommonError.self, from: data)
            let returnError = error?.code ?? error?.message ?? ""
            return returnError.capitalizingFirstLetter().replacingOccurrences(of: "_", with: " ")
        }
    }
}
