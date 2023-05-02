//
//  PriorityListCollectionViewCell.swift
//  LanguageLearningApllication
//
//  Created by Sonic on 1/5/23.
//

import UIKit

final class PriorityListCollectionViewCell: UICollectionViewCell {
    
    private var category: Category?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupoorted")
    }
    
    public func configure(using category: Category) {
        
        self.category = category
        titleLabel.text = category.name
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
        self.contentView.backgroundColor = category.isSelected ? UIColor(hex: category.color) : UIColor.systemBackground
    }
    
    public func updateBackground() {
        category?.isSelected.toggle()
        guard let category else { return }
        self.contentView.backgroundColor = category.isSelected ? UIColor(hex: category.color) : UIColor.systemBackground
    }
}
