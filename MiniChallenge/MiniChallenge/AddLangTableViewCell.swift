//
//  AddLangTableViewCell.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 22/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class AddLangTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var topics: UILabel!
    @IBOutlet weak var materials: UILabel!
    
    @IBOutlet weak var language: UIView!
    @IBOutlet weak var languageIcon: UIImageView!
    
    @IBOutlet weak var topicsView: UIView!
    @IBOutlet weak var materialsView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.language.layer.cornerRadius = 5
        self.topicsView.layer.cornerRadius = self.topicsView.frame.height / 2
        self.materialsView.layer.cornerRadius = self.materialsView.frame.height / 2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    public func setCell(_ title: String?, _ desc: String?, _ topics: Int, _ materials: Int, _ color: String?){
        self.title.text = title;
        self.desc.text = desc;
        self.topics.text = String(topics) + " TÓPICO" + (topics == 1 ? "" : "S");
        self.materials.text = String(materials) + " MATERIA" + (materials == 1 ? "L" : "IS");
        self.language.backgroundColor = UIColor(hex: color ?? "#777777")
        self.languageIcon.image = UIImage(named: title! + "Icon")
    }
}
