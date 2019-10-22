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
    
    
    public func setDoc(_ image: String?, _ title: String?, _ subheading: String?, _ source: String?){
        self.docTitle.text = title
        self.docSubheading.text = subheading
        self.docSource.text = source
        
        RequestAPI.fetchImage(image, docImage)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        docImage.layer.cornerRadius = 10;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
