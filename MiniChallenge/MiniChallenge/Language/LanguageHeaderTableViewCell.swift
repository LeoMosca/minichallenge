//
//  LanguageHeaderTableViewCell.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 09/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class LanguageHeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var topics: UILabel!
    @IBOutlet weak var items: UILabel!
    @IBOutlet weak var desc: UITextView!
    
    @IBOutlet weak var favbutton: UIView!
    
    public func setHeader(_ name: String, _ topics: Int, _ saw: Int?, _ items: Int, _ desc: String){
        self.name.text = name;
        self.topics.text = String(topics) + " tópicos / " + String(saw ?? 0) + " vistos";
        self.items.text = String(items) + " materials";
        self.desc.text = String(desc);
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        favbutton.layer.cornerRadius = favbutton.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
