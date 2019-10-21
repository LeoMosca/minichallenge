//
//  TopicsItemTableViewCell.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 09/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class TopicsItemTableViewCell: UITableViewCell {
    @IBOutlet weak var topicImage: UIImageView!
    @IBOutlet weak var topicName: UILabel!
    @IBOutlet weak var topicDescription: UITextView!
    @IBOutlet weak var howManyTools: UILabel!
    
    public func setItem(_ name: String?, _ desc: String?, _ amount: Int, _ image: String?) {
        self.topicName.text = name?.uppercased()
        self.topicDescription.text = desc
        self.howManyTools.text = String(amount) + " materia" + (amount == 1 ? "l": "is")
        
        topicImage.layer.cornerRadius = 10
        RequestAPI.fetchImage(image, topicImage)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func accessTools(_ sender: Any) {
    }
    
}
