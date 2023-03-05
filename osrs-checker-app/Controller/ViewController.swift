//
//  ViewController.swift
//  osrs-checker-app
//
//  Created by José Matela Neto on 05/03/23.
//

import UIKit

class ViewController: UIViewController {

    let hiscoreViewModel = HiscoreViewModel()
    var playerName: String = "matelaaaaaa"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .green
        
        self.hiscoreViewModel.getHiscorePlayer(name: self.playerName)
    }
}

