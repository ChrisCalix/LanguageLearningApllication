//
//  PronunciationCardCollectionViewCell.swift
//  LanguageLearningApllication
//
//  Created by Sonic on 2/5/23.
//

import UIKit

final class PronunciationCardCollectionViewCell: UICollectionViewCell {
    
    private let paginationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .thin)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        return label
    }()
    
    private let soundLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let meanLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .thin)
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    private let synonymsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "Synonyms"
        return label
    }()
    
    private let synonymsCollectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { _, _ in
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1.0)))
            item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40)), subitems: [item, item, item])
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(SynonymsCollectionViewCell.self, forCellWithReuseIdentifier: SynonymsCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    private var card: PronunciationCard?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        synonymsCollectionView.dataSource = self
        
        contentView.addSubview(paginationLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(soundLabel)
        contentView.addSubview(meanLabel)
        contentView.addSubview(synonymsTitleLabel)
        contentView.addSubview(synonymsCollectionView)
        contentView.layer.cornerRadius = 15
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    public func configure(using card: PronunciationCard, position: (current: Int, total: Int)) {
        
        self.card = card
        
        paginationLabel.text = "\(position.current)/\(position.total)"
        titleLabel.text = card.title
        soundLabel.text = card.pronunciationText
        meanLabel.text = card.mean
        contentView.backgroundColor = UIColor(hex: card.color)
    }
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            paginationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            paginationLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            paginationLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -40),
            
            titleLabel.topAnchor.constraint(equalTo: paginationLabel.bottomAnchor, constant: 40),
            titleLabel.leftAnchor.constraint(equalTo: paginationLabel.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: paginationLabel.rightAnchor),
            
            soundLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            soundLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            soundLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            
            meanLabel.topAnchor.constraint(equalTo: soundLabel.bottomAnchor, constant: 30),
            meanLabel.leftAnchor.constraint(equalTo: soundLabel.leftAnchor),
            meanLabel.rightAnchor.constraint(equalTo: soundLabel.rightAnchor),
            
            synonymsTitleLabel.topAnchor.constraint(equalTo: meanLabel.bottomAnchor, constant: 60),
            synonymsTitleLabel.leftAnchor.constraint(equalTo: meanLabel.leftAnchor),
            synonymsTitleLabel.rightAnchor.constraint(equalTo: meanLabel.rightAnchor),
            
            synonymsCollectionView.topAnchor.constraint(equalTo: synonymsTitleLabel.bottomAnchor, constant: 20),
            synonymsCollectionView.leftAnchor.constraint(equalTo: synonymsTitleLabel.leftAnchor),
            synonymsCollectionView.rightAnchor.constraint(equalTo: synonymsTitleLabel.rightAnchor),
            synonymsCollectionView.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}

extension PronunciationCardCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        card?.synonyms.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let card, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SynonymsCollectionViewCell.identifier, for: indexPath) as? SynonymsCollectionViewCell else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: SynonymsCollectionViewCell.identifier, for: indexPath)
        }
        cell.configure(using: card.synonyms[indexPath.row])
        return cell
    }
    
    
}
