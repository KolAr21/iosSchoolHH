//
//  Location.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 23.10.2023.
//

import Foundation

struct Location: Codable {
    let id: Int
    let name: String
    let type: String
    let dim: String
    let residents: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case dim = "dimention"
        case residents
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = (try? container.decode(String.self, forKey: .type)) ?? ""
        self.dim = try container.decode(String.self, forKey: .dim)
        self.residents = (try? container.decode([String].self, forKey: .residents)) ?? []
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.dim, forKey: .dim)
        try container.encode(self.residents, forKey: .residents)
    }
}
