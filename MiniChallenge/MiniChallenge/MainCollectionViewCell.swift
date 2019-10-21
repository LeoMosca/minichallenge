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
    @IBOutlet weak var icon_wrapper: UIView!
    @IBOutlet weak var languageicon: UIImageView!
    
    public func setLangCell(language: String, topics: Int, color: String){
        self.language.text = language;
        self.topics.text = String(topics) + " tópico" + (topics != 1 ? "s" : "")
        self.icon_wrapper.layer.borderColor = UIColor(hex: color).cgColor
        self.languageicon.image = UIImage(named: language)
        self.languageicon.tintColor = UIColor(hex: color)
    }
    
    override func awakeFromNib() {
        icon_wrapper.layer.cornerRadius = 15;
        icon_wrapper.layer.borderColor = UIColor(hex: "#000000").cgColor
        icon_wrapper.layer.borderWidth = 2
    }
}
