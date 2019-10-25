//
//  TopicsHeaderTableViewCell.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 09/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class TopicsHeaderTableViewCell: UITableViewCell{
    var colors = TopicColors.colors
    var corelang:LanguageAdded?
    var topicId:Int = -1
    
    @IBOutlet weak var languageImage: UIImageView!
    @IBOutlet weak var languageName: UILabel!
    @IBOutlet weak var topicName: UILabel!
    @IBOutlet weak var aboutTopic: UITextView!
    @IBOutlet weak var studyButton: UIButton!
    @IBOutlet weak var studyButtonImage: UIImageView!
    
    public func setHeader(_ topic: String?, _ desc: String?, _ lang: String?){
        self.topicName.text = topic?.uppercased();
        self.aboutTopic.text = desc;
        self.languageName.text = lang?.uppercased();
        self.languageImage.image = UIImage(named: topic ?? "")
        
        if let coretopics = corelang?.topics?.allObjects as? [TopicDone] {
            let maincolor = UIColor(hex: colors[topic ?? "#429AF9"] ?? "#429AF9")
            
            if coretopics.first(where: { $0.id_topic == Int16(self.topicId) }) != nil{
                self.studyButton.backgroundColor = maincolor
                self.studyButton.setTitle("Concluído", for: .normal)
                self.studyButton.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
                self.studyButtonImage.image = UIImage(named: "success")?.withRenderingMode(.alwaysTemplate)
                self.studyButtonImage.tintColor = UIColor(hex: "#FFFFFF")
            } else {
                self.studyButton.backgroundColor = UIColor(hex: "#FFFFFF")
                self.studyButton.setTitle("Já Estudei", for: .normal)
                self.studyButton.setTitleColor(maincolor, for: .normal)
                self.studyButton.layer.borderColor = maincolor.cgColor;
                self.studyButton.layer.borderWidth = 1
                self.studyButtonImage.image = UIImage(named: "notstudied")?.withRenderingMode(.alwaysTemplate)
                self.studyButtonImage.tintColor = maincolor
            }
        } else {
            print("Fail")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
