//
//  TopicsHeaderTableViewCell.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 09/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class TopicsHeaderTableViewCell: UITableViewCell{
    
    @IBOutlet weak var languageImage: UIImageView!
    
    @IBOutlet weak var languageName: UILabel!
    
    @IBOutlet weak var topicName: UILabel!
    
    @IBOutlet weak var aboutTopic: UITextView!
    
    @IBOutlet weak var studyButton: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
