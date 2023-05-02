//
//  PrioritiesView.swift
//  LanguageLearningApllication
//
//  Created by Sonic on 1/5/23.
//

import UIKit

protocol PrioritiesViewDelegate: AnyObject {
    
    func didPressedGetInAction()
}

final class PrioritiesView: UIView {
    
    weak var delegate: PrioritiesViewDelegate?
    private var collectionview: UICollectionView?
    private let getInbButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(
            NSAttributedString(
                string: "Get In",
                attributes: [
                    .font: UIFont.systemFont(ofSize: 18, weight: .medium),
                    .foregroundColor: UIColor.systemBackground,
//                    .backgroundColor: UIColor.label
                ]
            ),
            for: .normal
        )
        button.backgroundColor = UIColor.label
        button.layer.cornerRadius = 20
        return button
    }()
    private let skipbButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(
            NSAttributedString(
                string: "Skip",
                attributes: [
                    .font: UIFont.systemFont(ofSize: 18, weight: .medium),
                    .foregroundColor: UIColor.label,
//                    .backgroundColor: UIColor.label
                ]
            ),
            for: .normal
        )
        button.backgroundColor = UIColor.systemBackground
//        button.layer.cornerRadius = 20
        return button
    }()
    
    private let sections: [PrioritySecions] = [
        .category(categories: [
            .init(name: "Listening", color: "#89d1dc", id: 0),
            .init(name: "Grammar", color: "#c386f1", id: 1),
            .init(name: "Writing", color: "#f89cfa", id: 3, isSelected: true),
            .init(name: "Vocabulary", color: "#f0d689", id: 4),
            .init(name: "Pronunciation", color: "#f89cfa", id: 5),
            .init(name: "Activity", color: "#89d1dc", id: 6, isSelected: true),
            .init(name: "Inmersion", color: "#c386f1", id: 7),
            .init(name: "Translation", color: "#aff28b", id: 8),
        ]),
        .carousel(pages: [
            .init(title: "Pick you Priorities", description: "It's time to choose wich part of the language you want to improve"),
            .init(title: "Choose with Vision", description: "It's time to choose wich part of the language you want to improve")
        ]),
        .pageControl(numberOfPages: 2)
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let collection = createCollectionView()
        self.collectionview = collection
        guard let collectionview else { return }
        self.addSubview(collectionview)
        self.addSubview(getInbButton)
        self.addSubview(skipbButton)
        getInbButton.addTarget(self, action: #selector(didTapGetInButton), for: .touchUpInside)
        NSLayoutConstraint.activate([
            skipbButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            skipbButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            skipbButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            skipbButton.heightAnchor.constraint(equalToConstant: 50),
            
            getInbButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            getInbButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            getInbButton.bottomAnchor.constraint(equalTo: skipbButton.topAnchor, constant: -16),
            getInbButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            collectionview.topAnchor.constraint(equalTo: topAnchor),
            collectionview.leftAnchor.constraint(equalTo: leftAnchor,constant: 12),
            collectionview.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            collectionview.bottomAnchor.constraint(equalTo: getInbButton.topAnchor, constant: -16)
        ])
        collectionview.dataSource = self
        collectionview.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    func createCollectionView() -> UICollectionView {
        
        let layout = UICollectionViewCompositionalLayout { index , _ in
            return self.createSection(for: index)
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PriorityListCollectionViewCell.self, forCellWithReuseIdentifier: PriorityListCollectionViewCell.identifier)
        collectionView.register(PageCollectionViewCell.self, forCellWithReuseIdentifier: PageCollectionViewCell.identifier)
        collectionView.register(PagecontrollCollectionViewCell.self, forCellWithReuseIdentifier: PagecontrollCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }
    
    func createSection(for sectionIndex: Int) -> NSCollectionLayoutSection {
        
        switch sections[sectionIndex] {
        case .carousel:
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0)))
            item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 4, bottom: 0, trailing: 4)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(180)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPaging
            return section
        case .category:
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)))
            item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 4, bottom: 10, trailing: 4)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(80)), subitems: [item, item])
            let section = NSCollectionLayoutSection(group: group)
            return section
        case .pageControl:
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0)))
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
        
    }
    
    @objc func didTapGetInButton() {
        
        delegate?.didPressedGetInAction()
    }
}

extension PrioritiesView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let sectionType = sections[section]
        switch sectionType {
        case .category(let categories):
            return categories.count
        case .carousel(let pages):
            return pages.count
        case .pageControl:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let sectionType = sections[indexPath.section]
        switch sectionType {
        case .category(let categories):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PriorityListCollectionViewCell.identifier, for: indexPath) as? PriorityListCollectionViewCell else {
                fatalError("Unsupported")
            }
            cell.configure(using: categories[indexPath.row])
            return cell
        case .carousel(let pages):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageCollectionViewCell.identifier, for: indexPath) as? PageCollectionViewCell else {
                fatalError("Unsupported")
            }
            cell.configure(using: pages[indexPath.row])
            return cell
        case .pageControl(let numberOfPages):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PagecontrollCollectionViewCell.identifier, for: indexPath) as? PagecontrollCollectionViewCell else {
                fatalError("Unsupported")
            }
            cell.configure(numberOfPages: numberOfPages)
            return cell
        }
    }
}

extension PrioritiesView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
        let sectionType = sections[indexPath.section]
        switch sectionType {
        case .category:
            guard let cell = collectionView.cellForItem(at: indexPath) as?  PriorityListCollectionViewCell else {
                return
            }
            cell.updateBackground()
        default:
            break
        }
    }
}

enum PrioritySecions {
    
    case category(categories: [Category])
    case carousel(pages: [Page])
    case pageControl(numberOfPages: Int)
}
