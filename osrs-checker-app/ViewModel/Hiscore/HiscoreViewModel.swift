//
//  HiscoreViewModel.swift
//  osrs-checker-app
//
//  Created by José Matela Neto on 05/03/23.
//

import Foundation

class HiscoreViewModel {
    
    let hiscoreService = HiscoreService()
    
    func getHiscorePlayer(name: String?) {
        if let name = name {
            self.hiscoreService.fetchHiscorePlayer(name: name) { hiscore in
                for info in hiscore {
                    print(info)
                }
            }
        }
    }
}
