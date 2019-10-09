//
//  ToolsHeaderTableViewCell.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 09/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class ToolsHeaderTableViewCell: UITableViewCell {

    
    @IBOutlet weak var numberOfItens: UILabel!
    @IBOutlet weak var numberOfItensView: UIView!
    @IBOutlet weak var toolImage: UIImageView!
    @IBOutlet weak var toolName: UILabel!
    @IBOutlet weak var toolDescription: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        numberOfItensView.layer.cornerRadius = numberOfItensView.frame.height / 2;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
