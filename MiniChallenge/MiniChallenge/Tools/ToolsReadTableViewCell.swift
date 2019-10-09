//
//  ToolsReadTableViewCell.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 09/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class ToolsReadTableViewCell: UITableViewCell {

    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitle: UITextView!
    @IBOutlet weak var articleSubheading: UITextView!
    @IBOutlet weak var articleSource: UITextView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        articleImage.layer.cornerRadius = articleImage.frame.height / 2;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
