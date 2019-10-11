//
//  TopicsViewController.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 09/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class TopicsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var lang: Language = Language()
    var topicIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (lang.topics?.count ?? 0) + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 359 : 182
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        if(indexPath.row == 0){
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCellHeader", for: indexPath) as? TopicsHeaderTableViewCell{
                
                cell.topicName.text = lang.topics?[topicIndex].name
                cell.aboutTopic.text = lang.topics?[topicIndex].description
                cell.languageName.text = lang.language
                
                
                //Borda das imagens
                cell.studyButton.layer.borderWidth = 1
                cell.studyButton.layer.masksToBounds = false
                cell.studyButton.layer.borderColor = UIColor.black.cgColor
                cell.studyButton.layer.cornerRadius = cell.studyButton.frame.height/3
                cell.studyButton.clipsToBounds = true
                
                return cell
            }
            
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCellItem", for: indexPath) as? TopicsItemTableViewCell{
                
                cell.topicName.text = lang.topics?[topicIndex].tools?[indexPath.row - 1 ].name
                
                cell.topicDescription.text = lang.topics?[topicIndex].tools?[indexPath.row - 1 ].description
                
                cell.howManyTools.text = String(lang.topics![topicIndex].tools!.count)
                
                
                
                return cell
                
            }
            
            
        }
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
