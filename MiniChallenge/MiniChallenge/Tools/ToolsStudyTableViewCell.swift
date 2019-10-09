//
//  ToolsStudyTableViewCell.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 09/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class ToolsStudyTableViewCell: UITableViewCell {

    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var courseTitle: UITextView!
    @IBOutlet weak var courseSubheading: UITextView!
    @IBOutlet weak var courseAuthor: UILabel!
    @IBOutlet weak var courseLength: UILabel!
    @IBOutlet weak var courseRating: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        courseImage.layer.cornerRadius = courseImage.frame.height / 2;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
