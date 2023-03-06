//
//  ViewController.swift
//  osrs-checker-app
//
//  Created by José Matela Neto on 05/03/23.
//

import UIKit

class ViewController: UIViewController {

    lazy var tableView: UITableView = {
        var tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    let hiscoreViewModel = HiscoreViewModel()
    var playerName: String = "matelaaaaaa"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .green
        
        self.hiscoreViewModel.getHiscorePlayer(name: self.playerName)
        
        self.setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    private func setupUI() {
        self.view.addSubview(self.tableView)
        
        self.setupTableView()
        
        self.setupConstraints()
    }
    
    private func setupTableView() {
        self.tableView.backgroundColor = .red
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(ViewControllerTableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.tableView.separatorStyle = .none
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.hiscoreViewModel.hiscore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ViewControllerTableViewCell
        
        cell.bind(hiscore: self.hiscoreViewModel.hiscore[indexPath.item])
        
        return cell
    }
}

