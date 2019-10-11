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
        if(indexPath.row == 0) {
            return 380
        } else {
            return 70
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (lang.topics!.count ?? 0) + 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "languageHeader", for: indexPath) as? LanguageHeaderTableViewCell {
            cell.setHeader(lang.language!, lang.topics!.count, nil, 30, lang.description!)
            return cell;
        }
        else if let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell", for: indexPath) as? LanguageItemTableViewCell {
            let topic = lang.topics![indexPath.row]
            cell.setItem(topic.name!, topic.tools!.count, "")
            
            return cell;
        }
        else {
            return UITableViewCell()
        }
    }
}
