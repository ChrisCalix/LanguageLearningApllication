//
//  SynonymsCollectionViewCell.swift
//  LanguageLearningApllication
//
//  Created by Sonic on 2/5/23.
//

import UIKit

class SynonymsCollectionViewCell: UICollectionViewCell {
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .center
       return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    func configure(using title: String) {
        
        titleLabel.text = title
    }
}
