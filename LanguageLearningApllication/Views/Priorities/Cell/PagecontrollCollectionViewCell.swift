//
//  PagecontrollCollectionViewCell.swift
//  LanguageLearningApllication
//
//  Created by Sonic on 1/5/23.
//

import UIKit

final class PagecontrollCollectionViewCell: UICollectionViewCell {
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
//        pageControl.tintColor = .label
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.backgroundStyle = .minimal
        pageControl.currentPage = 0
        return pageControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(pageControl)
        
//        contentView.backgroundColor = .red
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: contentView.topAnchor),
            pageControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            pageControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            pageControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            pageControl.widthAnchor.constraint(equalToConstant: contentView.bounds.width),
            pageControl.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    public func configure(numberOfPages pages: Int) {
        
        pageControl.numberOfPages = pages
        pageControl.pageIndicatorTintColor = .secondaryLabel
        pageControl.currentPageIndicatorTintColor = .label
    }
}
