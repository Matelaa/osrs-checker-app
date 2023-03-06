//
//  Hiscore.swift
//  osrs-checker-app
//
//  Created by José Matela Neto on 05/03/23.
//

import Foundation

struct Hiscore: Codable {
    let skill: SkillType
    let rank: String
    let level: String
    let xp: String
    
    init(skill: SkillType, rank: String, level: String, xp: String) {
        self.skill = skill
        self.rank = rank
        self.level = level
        self.xp = xp
    }
}

enum SkillType: String, Codable {
    case overall
    case attack
    case defence
    case strength
    case hitpoints
    case ranged
    case prayer
    case magic
    case cooking
    case woodcutting
    case fletching
    case fishing
    case firemaking
    case crafting
    case smithing
    case mining
    case herblore
    case agility
    case thieving
    case slayer
    case farming
    case runecrafting
    case hunter
    case construction
}
