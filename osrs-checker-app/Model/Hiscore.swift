//
//  Hiscore.swift
//  osrs-checker-app
//
//  Created by José Matela Neto on 05/03/23.
//

import Foundation

struct Hiscore: Codable {
    let rank: String
    let level: String
    let xp: String
    
    enum CodingKeys: String, CodingKey {
        case rank, level, xp
    }
}
