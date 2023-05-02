//
//  PageCollectionViewCell.swift
//  LanguageLearningApllication
//
//  Created by Sonic on 1/5/23.
//

import UIKit

final class PageCollectionViewCell: UICollectionViewCell {
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next Condensed Heavy", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "TAvenir Next Condensed Regular", size: 15)
        label.textColor = UIColor.secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
        
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    public func configure(using page: Page) {
        
        titleLabel.text = page.title
        descriptionLabel.text = page.description
    }
}

