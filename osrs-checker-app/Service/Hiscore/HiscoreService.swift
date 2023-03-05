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
                
                var hiscoreDictionary = [[String: Any]]()
                
                let lines = responseString.split(separator: "\n")
                
                for line in lines {
                    if self.count <= 23 {
                        let values = line.split(separator: ",")
                        let object = ["rank" : values[0],
                                      "level": values[1],
                                      "xp"   : values[2]]
                        
                        hiscoreDictionary.append(object)
                    }
                    self.count += 1
                }
                
                let jsonData = try! JSONSerialization.data(withJSONObject: hiscoreDictionary)
                let hiscorePlayer = try! JSONDecoder().decode([Hiscore].self, from: jsonData)
                completion(hiscorePlayer)
            }
        }
        
        task.resume()
    }
}

