//
//  TopicsHeaderTableViewCell.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 09/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class TopicsHeaderTableViewCell: UITableViewCell{
    var language:Language?
    var topic:Int?
    
    @IBOutlet weak var languageImage: UIImageView!
    @IBOutlet weak var languageName: UILabel!
    @IBOutlet weak var topicName: UILabel!
    @IBOutlet weak var aboutTopic: UITextView!
    @IBOutlet weak var studyButton: UIButton!
    
    public func setHeader(_ topic: String?, _ desc: String?, _ lang: String?){
        self.topicName.text = topic?.uppercased();
        self.aboutTopic.text = desc;
        self.languageName.text = lang?.uppercased();
        self.languageImage.image = UIImage(named: topic ?? "")
        
//        self.studyButton.layer.masksToBounds = false
        self.studyButton.layer.cornerRadius = 7
//        self.studyButton.clipsToBounds = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func addTopic(_ sender: Any) {
        guard let language = self.language else { return }
        guard let topic = self.topic else { return }
        
        if language.topics?[topic] != nil {
            CoreDataManager.sharedInstance
        }
    }
    
}
