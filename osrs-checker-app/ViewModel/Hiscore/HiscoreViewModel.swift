//
//  HiscoreViewModel.swift
//  osrs-checker-app
//
//  Created by José Matela Neto on 05/03/23.
//

import Foundation

protocol HiscoreViewModelDelegate {
    func getHiscorePlayer()
}

class HiscoreViewModel {
    
    var delegate: HiscoreViewModelDelegate!
    private let hiscoreService = HiscoreService()
    
    var hiscore: [Hiscore] = []
    
    func getHiscore(name: String) {
        self.hiscoreService.fetchHiscorePlayer(name: name) { hiscore in
            self.hiscore = hiscore
            self.delegate.getHiscorePlayer()
        }
    }
}
