//
//  Date+dateFormatter.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 04.12.2023.
//

import Foundation

extension Date {
    var dateTimeString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YY"
        return dateFormatter.string(from: self)
    }
}
