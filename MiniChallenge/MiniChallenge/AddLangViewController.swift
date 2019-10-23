//
//  AddLangTableViewController.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 22/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class AddLangViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var languages:[Language] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;

    }
    
    override func viewDidAppear(_ animated: Bool) {
        RequestAPI.fetchLanguages { (resp) in
            self.languages = resp
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110;
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? AddLangTableViewCell {
            let row = indexPath.row;
            let lang = languages[row]
            var materials = 0;
            for t in lang.topics! {
                for c in t.tools! {
                    materials += c.content?.count ?? 0
                }
            }
            
            cell.setCell(lang.language, lang.description, lang.topics!.count, materials, lang.color)
            return cell;
        }
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? LanguageViewController {
            if let item = tableView.indexPathForSelectedRow {
                dest.lang = languages[item.row];
            }
        }
    }

}
