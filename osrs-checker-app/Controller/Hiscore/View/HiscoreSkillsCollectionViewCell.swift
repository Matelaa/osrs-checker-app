//
//  HiscoreSkillsCollectionViewCell.swift
//  osrs-checker-app
//
//  Created by José Matela Neto on 16/03/23.
//

import UIKit

class HiscoreSkillsCollectionViewCell: UICollectionViewCell {
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: ""))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var skillLevelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.numberOfLines = 0
        label.text = "99"
        
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupUI()
    }
    
    func bind(hiscore: Hiscore) {
        self.iconImageView.image = UIImage(named: "\(hiscore.skill.rawValue)_icon")
        self.skillLevelLabel.text = hiscore.level
//        self.skillLevelLabel.text = hiscore.skill.rawValue
    }
    
    private func setupUI() {
        self.addSubview(self.iconImageView)
        self.addSubview(self.skillLevelLabel)
        
        self.setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.iconImageView.heightAnchor.constraint(equalToConstant: 16),
            self.iconImageView.widthAnchor.constraint(equalToConstant: 16),
            self.iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            self.skillLevelLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.skillLevelLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
