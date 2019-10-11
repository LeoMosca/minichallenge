//
//  LanguageViewController.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 09/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class LanguageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var lang:Language = Language()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 380 : 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lang.topics!.count + 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            if let cell = tableView.dequeueReusableCell(withIdentifier: "languageHeader", for: indexPath) as? LanguageHeaderTableViewCell {
                cell.setHeader(lang.language!, lang.topics!.count, nil, 30, lang.description!)
                return cell;
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell", for: indexPath) as? LanguageItemTableViewCell {
                let topic = lang.topics![indexPath.row - 1]
                cell.setItem(topic.name!, topic.tools!.count, "estrela")
                
                return cell;
            }
        }
        
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? TopicsViewController {
            dest.lang = self.lang
            if let indexPath = tableView.indexPathForSelectedRow {
                dest.topicIndex = indexPath.row - 1
            }
        }
    }
}
