//
//  NSObject+ClassName.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 27.11.2023.
//

import Foundation

extension NSObject {
    static var className: String {
        String(describing: Self.self)
    }
}
