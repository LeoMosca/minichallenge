//
//  MainCollectionViewCell.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 10/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var topics: UILabel!
    
    public func setLangCell(language: String, topics: Int){
        self.language.text = language;
        self.topics.text = String(topics) + " tópico" + (topics != 1 ? "s" : "")
    }
    
}
