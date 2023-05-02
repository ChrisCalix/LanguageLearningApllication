//
//  PronunciationView.swift
//  LanguageLearningApllication
//
//  Created by Sonic on 2/5/23.
//

import UIKit

final class PronunciationView: UIView {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { _, _ in
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(500)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPaging
            return section
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(PronunciationCardCollectionViewCell.self, forCellWithReuseIdentifier: PronunciationCardCollectionViewCell.identifier)
        return collectionView
    }()
    
    private let stackButtons: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let speakButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "speaker.wave.3.fill")!, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.label.cgColor
        button.layer.cornerRadius = 10
        button.tintColor = UIColor.label
        return button
    }()
    
    private let microphoneButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "mic.fill")!, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.label.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = .label
        button.tintColor = UIColor.systemBackground
        return button
    }()
    
    private let rateButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star.fill")!, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.label.cgColor
        button.tintColor = UIColor.label
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let cards: [PronunciationCard]!
    
    init(frame: CGRect, using cards: [PronunciationCard]) {
        self.cards = cards
        super.init(frame: frame)
        
        stackButtons.addArrangedSubview(speakButton)
        stackButtons.addArrangedSubview(microphoneButton)
        stackButtons.addArrangedSubview(rateButton)
        backgroundColor = .systemBackground
        addSubview(stackButtons)
        addSubview(collectionView)
        collectionView.dataSource = self
        addConstraints()
    }
    
    fileprivate func addConstraints() {
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            
            
            stackButtons.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            stackButtons.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            stackButtons.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            stackButtons.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            stackButtons.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
}

extension PronunciationView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PronunciationCardCollectionViewCell.identifier, for: indexPath) as? PronunciationCardCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(using: cards[indexPath.row], position: ((indexPath.row+1), cards.count))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        cards.count
    }
    
}
