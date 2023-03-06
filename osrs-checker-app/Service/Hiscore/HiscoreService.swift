//
//  HiscoreService.swift
//  osrs-checker-app
//
//  Created by José Matela Neto on 05/03/23.
//

import Foundation

class HiscoreService {
    var count: Int = 0
    let hiscoreURL: String = "https://secure.runescape.com/m=hiscore_oldschool/index_lite.ws?player="
    
    func fetchHiscorePlayer(name: String, completion: @escaping ([Hiscore]) -> ()) {
        
        let requestURL = self.hiscoreURL + name
        
        let url = URL(string: requestURL)!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let responseData = data else {return}
            
            if let responseString = String(data: responseData, encoding: .utf8) {
                
                var hiscores = [Hiscore]()
                
                let skillTypes: [SkillType] = [.overall,
                                               .attack,
                                               .defence,
                                               .strength,
                                               .hitpoints,
                                               .ranged,
                                               .prayer,
                                               .magic,
                                               .cooking,
                                               .woodcutting,
                                               .fletching,
                                               .fishing,
                                               .firemaking,
                                               .crafting,
                                               .smithing,
                                               .mining,
                                               .herblore,
                                               .agility,
                                               .thieving,
                                               .slayer,
                                               .farming,
                                               .runecrafting,
                                               .hunter,
                                               .construction]
                                
                let lines = responseString.split(separator: "\n")
                
                for line in lines {
                    if self.count <= 23 {
                        let values = line.split(separator: ",")
                        
                        let skillType = skillTypes[self.count]
                        let rank = values[0]
                        let level = values[1]
                        let xp = values[2]
                        
                        let hiscore = Hiscore(skill: skillType, rank: String(rank), level: String(level), xp: String(xp))
                        
                        hiscores.append(hiscore)
                    }
                    self.count += 1
                }
                
                completion(hiscores)
            }
        }
        
        task.resume()
    }
}

