//
//  PrioritiesViewController.swift
//  LanguageLearningApllication
//
//  Created by Sonic on 1/5/23.
//

import UIKit

final class PrioritiesViewController: UIViewController {
    
    let priorityView: PrioritiesView!
    
    init() {
        priorityView = PrioritiesView(frame: .zero)
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Priorities"
        priorityView.translatesAutoresizingMaskIntoConstraints = false
        priorityView.delegate = self
        view.addSubview(priorityView)
        NSLayoutConstraint.activate([
            priorityView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            priorityView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            priorityView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            priorityView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
   
}

extension PrioritiesViewController: PrioritiesViewDelegate {
    
    func didPressedGetInAction() {
     
        let pronunciationVC = PronunciationViewController()
        navigationController?.pushViewController(pronunciationVC, animated: true)
    }
}

