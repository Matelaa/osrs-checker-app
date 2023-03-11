//
//  HiscoreViewModel.swift
//  osrs-checker-app
//
//  Created by José Matela Neto on 05/03/23.
//

import Foundation

protocol HiscoreViewModelDelegate {
    func getHiscorePlayer(hasItem: Bool)
}

class HiscoreViewModel {
    
    var delegate: HiscoreViewModelDelegate!
    private let hiscoreService = HiscoreService()
    
    var hiscore: [Hiscore] = []
    
    func getHiscore(name: String) {
        self.hiscoreService.fetchHiscorePlayer(name: name) { statusCode, hiscore  in
            switch statusCode {
            case 200:
                self.hiscore = hiscore
            default:
                self.hiscore = []
            }
            self.delegate.getHiscorePlayer(hasItem: !self.hiscore.isEmpty)
        }
    }
}
