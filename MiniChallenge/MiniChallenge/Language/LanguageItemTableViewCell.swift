//
//  LanguageItemTableViewCell.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 09/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class LanguageItemTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var item: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    public func setItem(_ name: String, _ items: Int, _ icon: String){
        self.name.text = name;
        self.item.text = String(items) + " itens";
        self.icon.image = UIImage(named: icon);
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
