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
        return (lang.topics?[topicIndex].tools?.count ?? 0) + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 359 : 182
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCellHeader", for: indexPath) as? TopicsHeaderTableViewCell{
                let topic = lang.topics?[topicIndex].name
                let description = lang.topics?[topicIndex].description
                let language = lang.language
                
                cell.setHeader(topic, description, language)
                return cell
            }
            
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCellItem", for: indexPath) as? TopicsItemTableViewCell{
                
                let toolname = lang.topics?[topicIndex].tools?[indexPath.row - 1 ].name;
                let toolamount = lang.topics![topicIndex].tools!.count;
                let description = lang.topics?[topicIndex].tools?[indexPath.row - 1 ].description;
                
                cell.setItem(toolname, description, toolamount);
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
