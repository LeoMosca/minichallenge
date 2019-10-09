//
//  ToolsWatchTableViewCell.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 09/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class ToolsWatchTableViewCell: UITableViewCell {

    @IBOutlet weak var docImage: UIImageView!
    @IBOutlet weak var docTitle: UITextView!
    @IBOutlet weak var docSubheading: UITextView!
    @IBOutlet weak var docSource: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        docImage.layer.cornerRadius = docImage.frame.height / 2;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
