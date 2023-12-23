//
//  CoreCellInputData.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 07.12.2023.
//

import Foundation

protocol CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)? { get }
}
