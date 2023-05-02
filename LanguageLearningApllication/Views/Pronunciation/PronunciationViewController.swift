//
//  PronunciationViewController.swift
//  LanguageLearningApllication
//
//  Created by Sonic on 2/5/23.
//

import UIKit

class PronunciationViewController: UIViewController {

    var pronunciationView: PronunciationView!
    let cards: [PronunciationCard] = [
        .init(title: "Euphoria", pronunciationText: "/ju:'fć:rtē", mean: "Euphoria is a state of intense happiness and and excitement that can be accompanied by feelings of excilaration, joy.", synonyms: ["Bliss","Rapture","Delight","Nirvana"], color: "#f89cfa"),
        .init(title: "Table", pronunciationText: "Teibl", mean: "Euphoria is a state of intense happiness and and excitement that can be accompanied by feelings of excilaration, joy.", synonyms: ["Bliss","Rapture","Delight","Nirvana"], color: "#89d1dc"),
        .init(title: "Book", pronunciationText: "bük", mean: "Euphoria is a state of intense happiness and and excitement that can be accompanied by feelings of excilaration, joy.", synonyms: ["Bliss","Rapture","Delight","Nirvana"], color: "#c386f1")
    ]
    
    init() {
        pronunciationView = PronunciationView(frame: .zero, using: cards)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Pronunciation"
        view.backgroundColor = .systemBackground
        view.addSubview(pronunciationView)
        addCosntraints()
    }
    
    fileprivate func addCosntraints() {
        
        pronunciationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pronunciationView.topAnchor.constraint(equalTo: view.topAnchor),
            pronunciationView.leftAnchor.constraint(equalTo: view.leftAnchor),
            pronunciationView.rightAnchor.constraint(equalTo: view.rightAnchor),
            pronunciationView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}

