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
            if let data {
                let error = try? JSONDecoder().decode(CommonError.self, from: data)
                return error?.code.capitalizingFirstLetter().replacingOccurrences(of: "_", with: " ") ?? ""
            } else {
                return "Произошла неизвестная ошибка"
            }
        }
    }
}

struct CommonError: Codable {
    var code: String
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
