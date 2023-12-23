//
//  String+capitalizing.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 28.11.2023.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
