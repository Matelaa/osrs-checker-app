//
//  HiscoreViewModel.swift
//  osrs-checker-app
//
//  Created by José Matela Neto on 05/03/23.
//

import Foundation

class HiscoreViewModel {
    
    let hiscoreService = HiscoreService()
    var hiscore: [Hiscore] = []
    
    func getHiscorePlayer(name: String?) {
        if let name = name {
            self.hiscoreService.fetchHiscorePlayer(name: name) { hiscore in
                self.hiscore = hiscore
            }
        }
    }
}
