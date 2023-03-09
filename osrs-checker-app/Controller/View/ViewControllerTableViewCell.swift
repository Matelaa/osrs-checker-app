//
//  ViewControllerTableViewCell.swift
//  osrs-checker-app
//
//  Created by José Matela Neto on 06/03/23.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {
    
    lazy var nameSkillLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        
        return label
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        self.setupUI()
    }
    
    func bind(hiscore: Hiscore) {
        self.nameSkillLabel.text = hiscore.skill.rawValue.capitalized
    }
    
    private func setupUI() {
        self.addSubview(self.nameSkillLabel)
        
        self.setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.nameSkillLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.nameSkillLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
